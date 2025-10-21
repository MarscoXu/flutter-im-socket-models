import 'package:json_annotation/json_annotation.dart';

part 'invalid_user.g.dart';

/// Model for invalidUser event
@JsonSerializable()
class InvalidUserData {
  final String userId;
  final String message;
  final String? reason;

  InvalidUserData({
    required this.userId,
    required this.message,
    this.reason,
  });

  factory InvalidUserData.fromJson(Map<String, dynamic> json) =>
      _$InvalidUserDataFromJson(json);

  Map<String, dynamic> toJson() => _$InvalidUserDataToJson(this);
}
