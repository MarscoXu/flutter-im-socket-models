/// Token 失效数据模型
class TokenExpiredData {
  final String? message;
  final String? reason;
  final int? timestamp;

  TokenExpiredData({
    this.message,
    this.reason,
    this.timestamp,
  });

  factory TokenExpiredData.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      return TokenExpiredData();
    }

    return TokenExpiredData(
      message: json['message'] as String?,
      reason: json['reason'] as String?,
      timestamp: json['timestamp'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (message != null) 'message': message,
      if (reason != null) 'reason': reason,
      if (timestamp != null) 'timestamp': timestamp,
    };
  }

  @override
  String toString() =>
      'TokenExpiredData(message: $message, reason: $reason, timestamp: $timestamp)';
}
