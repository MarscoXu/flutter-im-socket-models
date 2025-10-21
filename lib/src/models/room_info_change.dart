import 'package:json_annotation/json_annotation.dart';

part 'room_info_change.g.dart';

/// 房间信息变更数据模型
@JsonSerializable()
class RoomInfoChangeData {
  final String? roomId;
  final String? roomName;
  final String? roomAvatar;
  final String? announcement;
  final Map<String, dynamic>? settings;
  final int? timestamp;
  final String? changeType;

  const RoomInfoChangeData({
    this.roomId,
    this.roomName,
    this.roomAvatar,
    this.announcement,
    this.settings,
    this.timestamp,
    this.changeType,
  });

  factory RoomInfoChangeData.fromJson(Map<String, dynamic> json) =>
      _$RoomInfoChangeDataFromJson(json);

  Map<String, dynamic> toJson() => _$RoomInfoChangeDataToJson(this);

  @override
  String toString() => 'RoomInfoChangeData(roomId: $roomId, changeType: $changeType)';
}
