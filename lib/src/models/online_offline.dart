import 'package:json_annotation/json_annotation.dart';

part 'online_offline.g.dart';

/// 在线/离线状态数据模型
@JsonSerializable()
class OnlineOfflineData {
  final String? userId;
  final String? status;
  final int? timestamp;
  final String? deviceId;
  final Map<String, dynamic>? extra;

  const OnlineOfflineData({
    this.userId,
    this.status,
    this.timestamp,
    this.deviceId,
    this.extra,
  });

  factory OnlineOfflineData.fromJson(Map<String, dynamic> json) =>
      _$OnlineOfflineDataFromJson(json);

  Map<String, dynamic> toJson() => _$OnlineOfflineDataToJson(this);

  @override
  String toString() => 'OnlineOfflineData(userId: $userId, status: $status)';
}
