// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_approval_friend.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestApprovalFriendData _$RequestApprovalFriendDataFromJson(
        Map<String, dynamic> json) =>
    RequestApprovalFriendData(
      requestId: json['requestId'] as String?,
      fromUserId: json['fromUserId'] as String?,
      toUserId: json['toUserId'] as String?,
      message: json['message'] as String?,
      status: json['status'] as String?,
      timestamp: json['timestamp'] as int?,
      userInfo: json['userInfo'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$RequestApprovalFriendDataToJson(
        RequestApprovalFriendData instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'fromUserId': instance.fromUserId,
      'toUserId': instance.toUserId,
      'message': instance.message,
      'status': instance.status,
      'timestamp': instance.timestamp,
      'userInfo': instance.userInfo,
    };
