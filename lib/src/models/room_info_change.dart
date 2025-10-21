import 'package:json_annotation/json_annotation.dart';

part 'room_info_change.g.dart';

/// Model for roomInfoChange event
@JsonSerializable()
class RoomInfoChangeData {
  final String roomId;
  final String? roomName;
  final String? roomAvatar;
  final String? description;
  final Map<String, dynamic>? changedFields;

  RoomInfoChangeData({
    required this.roomId,
    this.roomName,
    this.roomAvatar,
    this.description,
    this.changedFields,
  });

  factory RoomInfoChangeData.fromJson(Map<String, dynamic> json) =>
      _$RoomInfoChangeDataFromJson(json);

  Map<String, dynamic> toJson() => _$RoomInfoChangeDataToJson(this);
}
