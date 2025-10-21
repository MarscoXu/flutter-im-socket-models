import 'package:json_annotation/json_annotation.dart';

part 'login_success.g.dart';

/// 登录成功数据模型
@JsonSerializable()
class LoginSuccessData {
  final String? userId;
  final String? token;
  final String? username;
  final String? avatar;
  final Map<String, dynamic>? userInfo;
  final int? timestamp;

  const LoginSuccessData({
    this.userId,
    this.token,
    this.username,
    this.avatar,
    this.userInfo,
    this.timestamp,
  });

  factory LoginSuccessData.fromJson(Map<String, dynamic> json) =>
      _$LoginSuccessDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoginSuccessDataToJson(this);

  @override
  String toString() => 'LoginSuccessData(userId: $userId, username: $username)';
}
