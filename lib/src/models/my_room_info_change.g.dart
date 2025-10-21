// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_room_info_change.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyRoomInfoChangeData _$MyRoomInfoChangeDataFromJson(
        Map<String, dynamic> json) =>
    MyRoomInfoChangeData(
      roomId: json['roomId'] as String?,
      myRole: json['myRole'] as String?,
      myNickname: json['myNickname'] as String?,
      isMuted: json['isMuted'] as bool?,
      permissions: json['permissions'] as Map<String, dynamic>?,
      timestamp: json['timestamp'] as int?,
    );

Map<String, dynamic> _$MyRoomInfoChangeDataToJson(
        MyRoomInfoChangeData instance) =>
    <String, dynamic>{
      'roomId': instance.roomId,
      'myRole': instance.myRole,
      'myNickname': instance.myNickname,
      'isMuted': instance.isMuted,
      'permissions': instance.permissions,
      'timestamp': instance.timestamp,
    };
