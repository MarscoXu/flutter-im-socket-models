/// 同步好友请求数据模型
class RequestApprovalFriendData {
  final String? requestId;
  final String? fromUserId;
  final String? toUserId;
  final String? message;
  final String? status;
  final int? timestamp;

  RequestApprovalFriendData({
    this.requestId,
    this.fromUserId,
    this.toUserId,
    this.message,
    this.status,
    this.timestamp,
  });

  factory RequestApprovalFriendData.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      return RequestApprovalFriendData();
    }

    return RequestApprovalFriendData(
      requestId: json['requestId'] as String?,
      fromUserId: json['fromUserId'] as String?,
      toUserId: json['toUserId'] as String?,
      message: json['message'] as String?,
      status: json['status'] as String?,
      timestamp: json['timestamp'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (requestId != null) 'requestId': requestId,
      if (fromUserId != null) 'fromUserId': fromUserId,
      if (toUserId != null) 'toUserId': toUserId,
      if (message != null) 'message': message,
      if (status != null) 'status': status,
      if (timestamp != null) 'timestamp': timestamp,
    };
  }

  @override
  String toString() =>
      'RequestApprovalFriendData(requestId: $requestId, fromUserId: $fromUserId, toUserId: $toUserId, status: $status)';
}
