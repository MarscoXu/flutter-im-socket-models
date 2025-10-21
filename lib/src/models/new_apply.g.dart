// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_apply.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewApplyData _$NewApplyDataFromJson(Map<String, dynamic> json) =>
    NewApplyData(
      applyId: json['applyId'] as String?,
      applicantId: json['applicantId'] as String?,
      targetId: json['targetId'] as String?,
      applyType: json['applyType'] as String?,
      message: json['message'] as String?,
      status: json['status'] as String?,
      timestamp: json['timestamp'] as int?,
    );

Map<String, dynamic> _$NewApplyDataToJson(NewApplyData instance) =>
    <String, dynamic>{
      'applyId': instance.applyId,
      'applicantId': instance.applicantId,
      'targetId': instance.targetId,
      'applyType': instance.applyType,
      'message': instance.message,
      'status': instance.status,
      'timestamp': instance.timestamp,
    };
