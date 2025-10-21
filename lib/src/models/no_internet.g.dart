// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'no_internet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoInternetData _$NoInternetDataFromJson(Map<String, dynamic> json) =>
    NoInternetData(
      message: json['message'] as String?,
      timestamp: json['timestamp'] as int?,
      isRetrying: json['isRetrying'] as bool?,
    );

Map<String, dynamic> _$NoInternetDataToJson(NoInternetData instance) =>
    <String, dynamic>{
      'message': instance.message,
      'timestamp': instance.timestamp,
      'isRetrying': instance.isRetrying,
    };
