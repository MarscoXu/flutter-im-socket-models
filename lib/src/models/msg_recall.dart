/// 消息撤回数据模型
class MsgRecallData {
  final String? messageId;
  final String? roomId;
  final String? operatorId;
  final int? timestamp;
  final String? reason;

  MsgRecallData({
    this.messageId,
    this.roomId,
    this.operatorId,
    this.timestamp,
    this.reason,
  });

  factory MsgRecallData.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      return MsgRecallData();
    }

    return MsgRecallData(
      messageId: json['messageId'] as String?,
      roomId: json['roomId'] as String?,
      operatorId: json['operatorId'] as String?,
      timestamp: json['timestamp'] as int?,
      reason: json['reason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (messageId != null) 'messageId': messageId,
      if (roomId != null) 'roomId': roomId,
      if (operatorId != null) 'operatorId': operatorId,
      if (timestamp != null) 'timestamp': timestamp,
      if (reason != null) 'reason': reason,
    };
  }

  @override
  String toString() =>
      'MsgRecallData(messageId: $messageId, roomId: $roomId, operatorId: $operatorId)';
}
