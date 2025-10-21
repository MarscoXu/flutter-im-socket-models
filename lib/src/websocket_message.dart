import 'socket_envelope.dart';
import 'message_factory.dart';

/// WebSocket 消息顶层封装类
/// 提供统一的工厂方法用于解析 WebSocket 消息
class WebSocketMessage {
  final String type;
  final dynamic data;

  WebSocketMessage({
    required this.type,
    required this.data,
  });

  /// 从 JSON 创建 WebSocketMessage 实例
  /// 根据 type 字段自动实例化对应的模型类
  factory WebSocketMessage.fromJson(Map<String, dynamic> json) {
    // 确保消息工厂已初始化
    MessageFactory.registerDefaults();
    
    final envelope = SocketEnvelope.fromJson(json);
    final decodedData = envelope.decode();
    
    return WebSocketMessage(
      type: envelope.type,
      data: decodedData,
    );
  }

  /// 从原始 WebSocket 字符串创建实例
  factory WebSocketMessage.fromRaw(String rawMessage) {
    // 确保消息工厂已初始化
    MessageFactory.registerDefaults();
    
    final envelope = SocketEnvelope.fromRaw(rawMessage);
    final decodedData = envelope.decode();
    
    return WebSocketMessage(
      type: envelope.type,
      data: decodedData,
    );
  }

  /// 转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'data': data,
    };
  }

  @override
  String toString() => 'WebSocketMessage(type: $type, data: $data)';
}
