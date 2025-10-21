import 'package:json_annotation/json_annotation.dart';

part 'token_expired.g.dart';

/// Model for tokenExpired event
@JsonSerializable()
class TokenExpiredData {
  final String message;
  final int timestamp;

  TokenExpiredData({
    required this.message,
    required this.timestamp,
  });

  factory TokenExpiredData.fromJson(Map<String, dynamic> json) =>
      _$TokenExpiredDataFromJson(json);

  Map<String, dynamic> toJson() => _$TokenExpiredDataToJson(this);
}
