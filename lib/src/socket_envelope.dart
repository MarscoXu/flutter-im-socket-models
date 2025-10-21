import 'dart:convert';
import 'message_factory.dart';

/// WebSocket 消息信封，包含消息类型和数据
class SocketEnvelope {
  final String type;
  final dynamic data;

  SocketEnvelope({required this.type, required this.data});

  /// 从原始字符串解析消息
  factory SocketEnvelope.fromRaw(String raw) {
    final json = jsonDecode(raw) as Map<String, dynamic>;
    return SocketEnvelope(
      type: json['type'] as String,
      data: json['data'],
    );
  }

  /// 解码消息数据
  dynamic decode() {
    return MessageFactory.decode(type, data);
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'data': data,
    };
  }
}
