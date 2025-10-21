// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invalid_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvalidUserData _$InvalidUserDataFromJson(Map<String, dynamic> json) =>
    InvalidUserData(
      userId: json['userId'] as String?,
      reason: json['reason'] as String?,
      message: json['message'] as String?,
      timestamp: json['timestamp'] as int?,
    );

Map<String, dynamic> _$InvalidUserDataToJson(InvalidUserData instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'reason': instance.reason,
      'message': instance.message,
      'timestamp': instance.timestamp,
    };
