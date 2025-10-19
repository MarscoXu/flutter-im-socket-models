import 'dart:async';
import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'socket_envelope.dart';

typedef EventHandler = void Function(String type, dynamic model);

/// WebSocket 服务封装 - 自动解析并分发消息
class SocketService {
  final WebSocketChannel _channel;
  final Map<String, List<EventHandler>> _handlers = {};
  StreamSubscription? _subscription;

  SocketService(this._channel) {
    _subscription = _channel.stream.listen(
      _onRawMessage,
      onError: _onError,
      onDone: _onDone,
    );
  }

  void _onRawMessage(dynamic raw) {
    try {
      final envelope = SocketEnvelope.fromRaw(raw.toString());
      final model = envelope.decode();
      _dispatch(envelope.type, model);
    } catch (e, st) {
      print('❌ Socket parse error: $e\n$st');
    }
  }

  void _dispatch(String type, dynamic model) {
    final handlers = _handlers[type];
    if (handlers != null) {
      for (final handler in List<EventHandler>.from(handlers)) {
        try {
          handler(type, model);
        } catch (e) {
          print('❌ Handler error for $type: $e');
        }
      }
    }
  }

  void on(String type, EventHandler handler) {
    _handlers.putIfAbsent(type, () => []).add(handler);
  }

  void off(String type, [EventHandler? handler]) {
    if (handler == null) {
      _handlers.remove(type);
    } else {
      _handlers[type]?.remove(handler);
    }
  }

  void sendJson(Map<String, dynamic> json) {
    _channel.sink.add(jsonEncode(json));
  }

  void send(String message) {
    _channel.sink.add(message);
  }

  void _onError(error) {
    print('❌ WebSocket error: $error');
  }

  void _onDone() {
    print('🔌 WebSocket closed');
  }

  void dispose() {
    _subscription?.cancel();
    _channel.sink.close();
  }
}