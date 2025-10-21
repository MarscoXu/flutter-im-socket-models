import 'package:json_annotation/json_annotation.dart';

part 'invalid_user.g.dart';

/// 无效用户数据模型
@JsonSerializable()
class InvalidUserData {
  final String? userId;
  final String? reason;
  final String? message;
  final int? timestamp;

  const InvalidUserData({
    this.userId,
    this.reason,
    this.message,
    this.timestamp,
  });

  factory InvalidUserData.fromJson(Map<String, dynamic> json) =>
      _$InvalidUserDataFromJson(json);

  Map<String, dynamic> toJson() => _$InvalidUserDataToJson(this);

  @override
  String toString() => 'InvalidUserData(userId: $userId, reason: $reason)';
}
