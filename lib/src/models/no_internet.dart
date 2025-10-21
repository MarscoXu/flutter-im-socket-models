/// 无网络连接数据模型
class NoInternetData {
  final String? message;
  final int? timestamp;

  NoInternetData({
    this.message,
    this.timestamp,
  });

  factory NoInternetData.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      return NoInternetData();
    }

    return NoInternetData(
      message: json['message'] as String?,
      timestamp: json['timestamp'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (message != null) 'message': message,
      if (timestamp != null) 'timestamp': timestamp,
    };
  }

  @override
  String toString() =>
      'NoInternetData(message: $message, timestamp: $timestamp)';
}
