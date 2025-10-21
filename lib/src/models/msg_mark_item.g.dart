// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'msg_mark_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MsgMarkItemData _$MsgMarkItemDataFromJson(Map<String, dynamic> json) =>
    MsgMarkItemData(
      messageId: json['messageId'] as String?,
      roomId: json['roomId'] as String?,
      userId: json['userId'] as String?,
      markType: json['markType'] as String?,
      timestamp: json['timestamp'] as int?,
      extra: json['extra'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$MsgMarkItemDataToJson(MsgMarkItemData instance) =>
    <String, dynamic>{
      'messageId': instance.messageId,
      'roomId': instance.roomId,
      'userId': instance.userId,
      'markType': instance.markType,
      'timestamp': instance.timestamp,
      'extra': instance.extra,
    };
