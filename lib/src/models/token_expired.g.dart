// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_expired.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenExpiredData _$TokenExpiredDataFromJson(Map<String, dynamic> json) =>
    TokenExpiredData(
      message: json['message'] as String?,
      expireTime: json['expireTime'] as int?,
      userId: json['userId'] as String?,
      needRelogin: json['needRelogin'] as bool?,
    );

Map<String, dynamic> _$TokenExpiredDataToJson(TokenExpiredData instance) =>
    <String, dynamic>{
      'message': instance.message,
      'expireTime': instance.expireTime,
      'userId': instance.userId,
      'needRelogin': instance.needRelogin,
    };
