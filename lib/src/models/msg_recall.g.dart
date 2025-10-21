// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'msg_recall.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MsgRecallData _$MsgRecallDataFromJson(Map<String, dynamic> json) =>
    MsgRecallData(
      messageId: json['messageId'] as String?,
      roomId: json['roomId'] as String?,
      recallerId: json['recallerId'] as String?,
      reason: json['reason'] as String?,
      timestamp: json['timestamp'] as int?,
    );

Map<String, dynamic> _$MsgRecallDataToJson(MsgRecallData instance) =>
    <String, dynamic>{
      'messageId': instance.messageId,
      'roomId': instance.roomId,
      'recallerId': instance.recallerId,
      'reason': instance.reason,
      'timestamp': instance.timestamp,
    };
