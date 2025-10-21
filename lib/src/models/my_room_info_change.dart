/// 我在群里的信息变更数据模型
class MyRoomInfoChangeData {
  final String? roomId;
  final String? myNickname;
  final String? myRole;
  final bool? isMuted;
  final Map<String, dynamic>? myInfo;
  final int? timestamp;

  MyRoomInfoChangeData({
    this.roomId,
    this.myNickname,
    this.myRole,
    this.isMuted,
    this.myInfo,
    this.timestamp,
  });

  factory MyRoomInfoChangeData.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      return MyRoomInfoChangeData();
    }

    return MyRoomInfoChangeData(
      roomId: json['roomId'] as String?,
      myNickname: json['myNickname'] as String?,
      myRole: json['myRole'] as String?,
      isMuted: json['isMuted'] as bool?,
      myInfo: json['myInfo'] as Map<String, dynamic>?,
      timestamp: json['timestamp'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (roomId != null) 'roomId': roomId,
      if (myNickname != null) 'myNickname': myNickname,
      if (myRole != null) 'myRole': myRole,
      if (isMuted != null) 'isMuted': isMuted,
      if (myInfo != null) 'myInfo': myInfo,
      if (timestamp != null) 'timestamp': timestamp,
    };
  }

  @override
  String toString() =>
      'MyRoomInfoChangeData(roomId: $roomId, myNickname: $myNickname, myRole: $myRole, isMuted: $isMuted)';
}
