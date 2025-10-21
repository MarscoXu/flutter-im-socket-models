/// 接收消息数据模型
class ReceiveMessageData {
  final String? messageId;
  final String? roomId;
  final String? senderId;
  final String? content;
  final String? messageType;
  final int? timestamp;
  final Map<String, dynamic>? extra;

  ReceiveMessageData({
    this.messageId,
    this.roomId,
    this.senderId,
    this.content,
    this.messageType,
    this.timestamp,
    this.extra,
  });

  factory ReceiveMessageData.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      return ReceiveMessageData();
    }

    return ReceiveMessageData(
      messageId: json['messageId'] as String?,
      roomId: json['roomId'] as String?,
      senderId: json['senderId'] as String?,
      content: json['content'] as String?,
      messageType: json['messageType'] as String?,
      timestamp: json['timestamp'] as int?,
      extra: json['extra'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (messageId != null) 'messageId': messageId,
      if (roomId != null) 'roomId': roomId,
      if (senderId != null) 'senderId': senderId,
      if (content != null) 'content': content,
      if (messageType != null) 'messageType': messageType,
      if (timestamp != null) 'timestamp': timestamp,
      if (extra != null) 'extra': extra,
    };
  }

  @override
  String toString() =>
      'ReceiveMessageData(messageId: $messageId, roomId: $roomId, senderId: $senderId, content: $content, messageType: $messageType, timestamp: $timestamp)';
}
