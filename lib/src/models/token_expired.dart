import 'package:json_annotation/json_annotation.dart';

part 'token_expired.g.dart';

/// Token过期数据模型
@JsonSerializable()
class TokenExpiredData {
  final String? message;
  final int? expireTime;
  final String? userId;
  final bool? needRelogin;

  const TokenExpiredData({
    this.message,
    this.expireTime,
    this.userId,
    this.needRelogin,
  });

  factory TokenExpiredData.fromJson(Map<String, dynamic> json) =>
      _$TokenExpiredDataFromJson(json);

  Map<String, dynamic> toJson() => _$TokenExpiredDataToJson(this);

  @override
  String toString() => 'TokenExpiredData(userId: $userId, needRelogin: $needRelogin)';
}
