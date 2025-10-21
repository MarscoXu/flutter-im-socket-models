import 'dart:convert';
import 'message_factory.dart';

/// WebSocket 消息信封 - 标准格式
class SocketEnvelope {
  final String type;
  final dynamic data;

  const SocketEnvelope({
    required this.type,
    this.data,
  });

  /// 从原始 WebSocket 消息解析
  factory SocketEnvelope.fromRaw(String raw) {
    final json = jsonDecode(raw) as Map<String, dynamic>;
    return SocketEnvelope(
      type: json['type'] as String,
      data: json['data'],
    );
  }

  /// 解析并转换为对应的 Model
  dynamic decode() {
    return MessageFactory.decode(type, data);
  }

  /// 转换为 JSON
  Map<String, dynamic> toJson() => {
        'type': type,
        'data': data,
      };

  @override
  String toString() => 'SocketEnvelope(type: $type, data: $data)';
}
