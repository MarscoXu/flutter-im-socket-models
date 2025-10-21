import 'dart:convert';
import 'message_factory.dart';

/// WebSocket 消息信封
/// 包含消息类型和数据载荷
class SocketEnvelope {
  final String type;
  final dynamic data;

  SocketEnvelope({
    required this.type,
    required this.data,
  });

  /// 从原始 WebSocket 消息创建信封
  factory SocketEnvelope.fromRaw(String rawMessage) {
    final json = jsonDecode(rawMessage) as Map<String, dynamic>;
    return SocketEnvelope.fromJson(json);
  }

  /// 从 JSON 创建信封
  factory SocketEnvelope.fromJson(Map<String, dynamic> json) {
    return SocketEnvelope(
      type: json['type'] as String,
      data: json['data'],
    );
  }

  /// 解码数据载荷为具体模型
  dynamic decode() {
    return MessageFactory.decode(type, data);
  }

  /// 转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'data': data,
    };
  }

  @override
  String toString() => 'SocketEnvelope(type: $type, data: $data)';
}
