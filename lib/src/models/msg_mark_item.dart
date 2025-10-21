/// 消息标记数据模型
class MsgMarkItemData {
  final String? messageId;
  final String? markType;
  final String? userId;
  final int? timestamp;
  final Map<String, dynamic>? extra;

  MsgMarkItemData({
    this.messageId,
    this.markType,
    this.userId,
    this.timestamp,
    this.extra,
  });

  factory MsgMarkItemData.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      return MsgMarkItemData();
    }

    return MsgMarkItemData(
      messageId: json['messageId'] as String?,
      markType: json['markType'] as String?,
      userId: json['userId'] as String?,
      timestamp: json['timestamp'] as int?,
      extra: json['extra'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (messageId != null) 'messageId': messageId,
      if (markType != null) 'markType': markType,
      if (userId != null) 'userId': userId,
      if (timestamp != null) 'timestamp': timestamp,
      if (extra != null) 'extra': extra,
    };
  }

  @override
  String toString() =>
      'MsgMarkItemData(messageId: $messageId, markType: $markType, userId: $userId)';
}
