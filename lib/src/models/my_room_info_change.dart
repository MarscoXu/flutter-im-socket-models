import 'package:json_annotation/json_annotation.dart';

part 'my_room_info_change.g.dart';

/// 我的房间信息变更数据模型
@JsonSerializable()
class MyRoomInfoChangeData {
  final String? roomId;
  final String? myRole;
  final String? myNickname;
  final bool? isMuted;
  final Map<String, dynamic>? permissions;
  final int? timestamp;

  const MyRoomInfoChangeData({
    this.roomId,
    this.myRole,
    this.myNickname,
    this.isMuted,
    this.permissions,
    this.timestamp,
  });

  factory MyRoomInfoChangeData.fromJson(Map<String, dynamic> json) =>
      _$MyRoomInfoChangeDataFromJson(json);

  Map<String, dynamic> toJson() => _$MyRoomInfoChangeDataToJson(this);

  @override
  String toString() => 'MyRoomInfoChangeData(roomId: $roomId, myRole: $myRole)';
}
