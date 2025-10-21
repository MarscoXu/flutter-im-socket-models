import 'package:json_annotation/json_annotation.dart';

part 'room_dissolution.g.dart';

/// Model for roomDissolution event
@JsonSerializable()
class RoomDissolutionData {
  final String roomId;
  final String? roomName;
  final String operatorId;
  final String? reason;
  final int timestamp;

  RoomDissolutionData({
    required this.roomId,
    this.roomName,
    required this.operatorId,
    this.reason,
    required this.timestamp,
  });

  factory RoomDissolutionData.fromJson(Map<String, dynamic> json) =>
      _$RoomDissolutionDataFromJson(json);

  Map<String, dynamic> toJson() => _$RoomDissolutionDataToJson(this);
}
