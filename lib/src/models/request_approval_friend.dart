import 'package:json_annotation/json_annotation.dart';

part 'request_approval_friend.g.dart';

/// Model for requestApprovalFriend event
@JsonSerializable()
class RequestApprovalFriendData {
  final String requestId;
  final String fromUserId;
  final String? fromUserName;
  final String? fromUserAvatar;
  final String? message;
  final int timestamp;

  RequestApprovalFriendData({
    required this.requestId,
    required this.fromUserId,
    this.fromUserName,
    this.fromUserAvatar,
    this.message,
    required this.timestamp,
  });

  factory RequestApprovalFriendData.fromJson(Map<String, dynamic> json) =>
      _$RequestApprovalFriendDataFromJson(json);

  Map<String, dynamic> toJson() => _$RequestApprovalFriendDataToJson(this);
}
