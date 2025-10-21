// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'online_offline.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OnlineOfflineData _$OnlineOfflineDataFromJson(Map<String, dynamic> json) =>
    OnlineOfflineData(
      userId: json['userId'] as String?,
      status: json['status'] as String?,
      timestamp: json['timestamp'] as int?,
      deviceId: json['deviceId'] as String?,
      extra: json['extra'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$OnlineOfflineDataToJson(OnlineOfflineData instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'status': instance.status,
      'timestamp': instance.timestamp,
      'deviceId': instance.deviceId,
      'extra': instance.extra,
    };
