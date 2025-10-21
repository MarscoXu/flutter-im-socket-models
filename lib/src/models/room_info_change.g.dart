// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_info_change.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomInfoChangeData _$RoomInfoChangeDataFromJson(Map<String, dynamic> json) =>
    RoomInfoChangeData(
      roomId: json['roomId'] as String?,
      roomName: json['roomName'] as String?,
      roomAvatar: json['roomAvatar'] as String?,
      announcement: json['announcement'] as String?,
      settings: json['settings'] as Map<String, dynamic>?,
      timestamp: json['timestamp'] as int?,
      changeType: json['changeType'] as String?,
    );

Map<String, dynamic> _$RoomInfoChangeDataToJson(RoomInfoChangeData instance) =>
    <String, dynamic>{
      'roomId': instance.roomId,
      'roomName': instance.roomName,
      'roomAvatar': instance.roomAvatar,
      'announcement': instance.announcement,
      'settings': instance.settings,
      'timestamp': instance.timestamp,
      'changeType': instance.changeType,
    };
