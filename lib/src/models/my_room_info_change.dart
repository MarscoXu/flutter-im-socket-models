import 'package:json_annotation/json_annotation.dart';

part 'my_room_info_change.g.dart';

/// Model for myRoomInfoChange event
@JsonSerializable()
class MyRoomInfoChangeData {
  final String roomId;
  final String? nickname;
  final String? role;
  final bool? isMuted;
  final Map<String, dynamic>? changedFields;

  MyRoomInfoChangeData({
    required this.roomId,
    this.nickname,
    this.role,
    this.isMuted,
    this.changedFields,
  });

  factory MyRoomInfoChangeData.fromJson(Map<String, dynamic> json) =>
      _$MyRoomInfoChangeDataFromJson(json);

  Map<String, dynamic> toJson() => _$MyRoomInfoChangeDataToJson(this);
}
