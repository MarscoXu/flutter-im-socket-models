// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_success.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginSuccessData _$LoginSuccessDataFromJson(Map<String, dynamic> json) =>
    LoginSuccessData(
      userId: json['userId'] as String?,
      token: json['token'] as String?,
      username: json['username'] as String?,
      avatar: json['avatar'] as String?,
      userInfo: json['userInfo'] as Map<String, dynamic>?,
      timestamp: json['timestamp'] as int?,
    );

Map<String, dynamic> _$LoginSuccessDataToJson(LoginSuccessData instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'token': instance.token,
      'username': instance.username,
      'avatar': instance.avatar,
      'userInfo': instance.userInfo,
      'timestamp': instance.timestamp,
    };
