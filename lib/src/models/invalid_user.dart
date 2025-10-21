/// 拉黑用户数据模型
class InvalidUserData {
  final String? userId;
  final String? reason;
  final int? timestamp;
  final bool? isPermanent;

  InvalidUserData({
    this.userId,
    this.reason,
    this.timestamp,
    this.isPermanent,
  });

  factory InvalidUserData.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      return InvalidUserData();
    }

    return InvalidUserData(
      userId: json['userId'] as String?,
      reason: json['reason'] as String?,
      timestamp: json['timestamp'] as int?,
      isPermanent: json['isPermanent'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (userId != null) 'userId': userId,
      if (reason != null) 'reason': reason,
      if (timestamp != null) 'timestamp': timestamp,
      if (isPermanent != null) 'isPermanent': isPermanent,
    };
  }

  @override
  String toString() =>
      'InvalidUserData(userId: $userId, reason: $reason, isPermanent: $isPermanent)';
}
