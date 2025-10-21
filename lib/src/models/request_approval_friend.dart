import 'package:json_annotation/json_annotation.dart';

part 'request_approval_friend.g.dart';

/// 请求好友审批数据模型
@JsonSerializable()
class RequestApprovalFriendData {
  final String? requestId;
  final String? fromUserId;
  final String? toUserId;
  final String? message;
  final String? status;
  final int? timestamp;
  final Map<String, dynamic>? userInfo;

  const RequestApprovalFriendData({
    this.requestId,
    this.fromUserId,
    this.toUserId,
    this.message,
    this.status,
    this.timestamp,
    this.userInfo,
  });

  factory RequestApprovalFriendData.fromJson(Map<String, dynamic> json) =>
      _$RequestApprovalFriendDataFromJson(json);

  Map<String, dynamic> toJson() => _$RequestApprovalFriendDataToJson(this);

  @override
  String toString() => 'RequestApprovalFriendData(requestId: $requestId, status: $status)';
}
