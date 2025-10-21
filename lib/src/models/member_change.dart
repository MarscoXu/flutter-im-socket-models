/// 成员变动数据模型
class MemberChangeData {
  final String? roomId;
  final String? changeType;
  final List<String>? userIds;
  final String? operatorId;
  final int? timestamp;
  final Map<String, dynamic>? extra;

  MemberChangeData({
    this.roomId,
    this.changeType,
    this.userIds,
    this.operatorId,
    this.timestamp,
    this.extra,
  });

  factory MemberChangeData.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      return MemberChangeData();
    }

    return MemberChangeData(
      roomId: json['roomId'] as String?,
      changeType: json['changeType'] as String?,
      userIds: (json['userIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      operatorId: json['operatorId'] as String?,
      timestamp: json['timestamp'] as int?,
      extra: json['extra'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (roomId != null) 'roomId': roomId,
      if (changeType != null) 'changeType': changeType,
      if (userIds != null) 'userIds': userIds,
      if (operatorId != null) 'operatorId': operatorId,
      if (timestamp != null) 'timestamp': timestamp,
      if (extra != null) 'extra': extra,
    };
  }

  @override
  String toString() =>
      'MemberChangeData(roomId: $roomId, changeType: $changeType, userIds: $userIds, operatorId: $operatorId)';
}
