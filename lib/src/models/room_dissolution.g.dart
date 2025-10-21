// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_dissolution.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomDissolutionData _$RoomDissolutionDataFromJson(Map<String, dynamic> json) =>
    RoomDissolutionData(
      roomId: json['roomId'] as String?,
      roomName: json['roomName'] as String?,
      operatorId: json['operatorId'] as String?,
      reason: json['reason'] as String?,
      timestamp: json['timestamp'] as int?,
    );

Map<String, dynamic> _$RoomDissolutionDataToJson(
        RoomDissolutionData instance) =>
    <String, dynamic>{
      'roomId': instance.roomId,
      'roomName': instance.roomName,
      'operatorId': instance.operatorId,
      'reason': instance.reason,
      'timestamp': instance.timestamp,
    };
