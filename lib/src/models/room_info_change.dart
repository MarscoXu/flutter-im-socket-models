/// 群聊信息变更数据模型
class RoomInfoChangeData {
  final String? roomId;
  final String? roomName;
  final String? roomAvatar;
  final String? announcement;
  final Map<String, dynamic>? roomInfo;
  final String? operatorId;
  final int? timestamp;

  RoomInfoChangeData({
    this.roomId,
    this.roomName,
    this.roomAvatar,
    this.announcement,
    this.roomInfo,
    this.operatorId,
    this.timestamp,
  });

  factory RoomInfoChangeData.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      return RoomInfoChangeData();
    }

    return RoomInfoChangeData(
      roomId: json['roomId'] as String?,
      roomName: json['roomName'] as String?,
      roomAvatar: json['roomAvatar'] as String?,
      announcement: json['announcement'] as String?,
      roomInfo: json['roomInfo'] as Map<String, dynamic>?,
      operatorId: json['operatorId'] as String?,
      timestamp: json['timestamp'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (roomId != null) 'roomId': roomId,
      if (roomName != null) 'roomName': roomName,
      if (roomAvatar != null) 'roomAvatar': roomAvatar,
      if (announcement != null) 'announcement': announcement,
      if (roomInfo != null) 'roomInfo': roomInfo,
      if (operatorId != null) 'operatorId': operatorId,
      if (timestamp != null) 'timestamp': timestamp,
    };
  }

  @override
  String toString() =>
      'RoomInfoChangeData(roomId: $roomId, roomName: $roomName, operatorId: $operatorId, timestamp: $timestamp)';
}
