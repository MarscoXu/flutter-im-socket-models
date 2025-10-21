/// 上线/下线数据模型
class OnlineOfflineData {
  final String? userId;
  final String? username;
  final int? timestamp;
  final String? status;

  OnlineOfflineData({
    this.userId,
    this.username,
    this.timestamp,
    this.status,
  });

  factory OnlineOfflineData.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      return OnlineOfflineData();
    }

    return OnlineOfflineData(
      userId: json['userId'] as String?,
      username: json['username'] as String?,
      timestamp: json['timestamp'] as int?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (userId != null) 'userId': userId,
      if (username != null) 'username': username,
      if (timestamp != null) 'timestamp': timestamp,
      if (status != null) 'status': status,
    };
  }

  @override
  String toString() =>
      'OnlineOfflineData(userId: $userId, username: $username, timestamp: $timestamp, status: $status)';
}
