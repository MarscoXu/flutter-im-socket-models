// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_change.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemberChangeData _$MemberChangeDataFromJson(Map<String, dynamic> json) =>
    MemberChangeData(
      roomId: json['roomId'] as String?,
      userId: json['userId'] as String?,
      changeType: json['changeType'] as String?,
      operatorId: json['operatorId'] as String?,
      reason: json['reason'] as String?,
      timestamp: json['timestamp'] as int?,
      userInfo: json['userInfo'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$MemberChangeDataToJson(MemberChangeData instance) =>
    <String, dynamic>{
      'roomId': instance.roomId,
      'userId': instance.userId,
      'changeType': instance.changeType,
      'operatorId': instance.operatorId,
      'reason': instance.reason,
      'timestamp': instance.timestamp,
      'userInfo': instance.userInfo,
    };
