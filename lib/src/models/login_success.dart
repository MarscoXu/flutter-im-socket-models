import 'package:json_annotation/json_annotation.dart';

part 'login_success.g.dart';

/// Model for loginSuccess event
@JsonSerializable()
class LoginSuccessData {
  final String userId;
  final String userName;
  final String? avatar;
  final String token;
  final int? expiresIn;

  LoginSuccessData({
    required this.userId,
    required this.userName,
    this.avatar,
    required this.token,
    this.expiresIn,
  });

  factory LoginSuccessData.fromJson(Map<String, dynamic> json) =>
      _$LoginSuccessDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoginSuccessDataToJson(this);
}
