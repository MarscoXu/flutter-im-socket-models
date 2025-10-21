// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receive_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReceiveMessageData _$ReceiveMessageDataFromJson(Map<String, dynamic> json) =>
    ReceiveMessageData(
      messageId: json['messageId'] as String?,
      roomId: json['roomId'] as String?,
      senderId: json['senderId'] as String?,
      content: json['content'] as String?,
      messageType: json['messageType'] as int?,
      timestamp: json['timestamp'] as int?,
      extra: json['extra'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$ReceiveMessageDataToJson(ReceiveMessageData instance) =>
    <String, dynamic>{
      'messageId': instance.messageId,
      'roomId': instance.roomId,
      'senderId': instance.senderId,
      'content': instance.content,
      'messageType': instance.messageType,
      'timestamp': instance.timestamp,
      'extra': instance.extra,
    };
