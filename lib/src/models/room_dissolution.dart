/// 群解散数据模型
class RoomDissolutionData {
  final String? roomId;
  final String? operatorId;
  final String? reason;
  final int? timestamp;

  RoomDissolutionData({
    this.roomId,
    this.operatorId,
    this.reason,
    this.timestamp,
  });

  factory RoomDissolutionData.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      return RoomDissolutionData();
    }

    return RoomDissolutionData(
      roomId: json['roomId'] as String?,
      operatorId: json['operatorId'] as String?,
      reason: json['reason'] as String?,
      timestamp: json['timestamp'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (roomId != null) 'roomId': roomId,
      if (operatorId != null) 'operatorId': operatorId,
      if (reason != null) 'reason': reason,
      if (timestamp != null) 'timestamp': timestamp,
    };
  }

  @override
  String toString() =>
      'RoomDissolutionData(roomId: $roomId, operatorId: $operatorId, reason: $reason)';
}
