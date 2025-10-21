/// 好友申请、群聊邀请数据模型
class NewApplyData {
  final String? applyId;
  final String? applyType;
  final String? fromUserId;
  final String? targetId;
  final String? message;
  final String? status;
  final int? timestamp;

  NewApplyData({
    this.applyId,
    this.applyType,
    this.fromUserId,
    this.targetId,
    this.message,
    this.status,
    this.timestamp,
  });

  factory NewApplyData.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      return NewApplyData();
    }

    return NewApplyData(
      applyId: json['applyId'] as String?,
      applyType: json['applyType'] as String?,
      fromUserId: json['fromUserId'] as String?,
      targetId: json['targetId'] as String?,
      message: json['message'] as String?,
      status: json['status'] as String?,
      timestamp: json['timestamp'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (applyId != null) 'applyId': applyId,
      if (applyType != null) 'applyType': applyType,
      if (fromUserId != null) 'fromUserId': fromUserId,
      if (targetId != null) 'targetId': targetId,
      if (message != null) 'message': message,
      if (status != null) 'status': status,
      if (timestamp != null) 'timestamp': timestamp,
    };
  }

  @override
  String toString() =>
      'NewApplyData(applyId: $applyId, applyType: $applyType, fromUserId: $fromUserId, targetId: $targetId)';
}
