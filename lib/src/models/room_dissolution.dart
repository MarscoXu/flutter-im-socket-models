import 'package:json_annotation/json_annotation.dart';

part 'room_dissolution.g.dart';

/// 房间解散数据模型
@JsonSerializable()
class RoomDissolutionData {
  final String? roomId;
  final String? roomName;
  final String? operatorId;
  final String? reason;
  final int? timestamp;

  const RoomDissolutionData({
    this.roomId,
    this.roomName,
    this.operatorId,
    this.reason,
    this.timestamp,
  });

  factory RoomDissolutionData.fromJson(Map<String, dynamic> json) =>
      _$RoomDissolutionDataFromJson(json);

  Map<String, dynamic> toJson() => _$RoomDissolutionDataToJson(this);

  @override
  String toString() => 'RoomDissolutionData(roomId: $roomId, roomName: $roomName)';
}
