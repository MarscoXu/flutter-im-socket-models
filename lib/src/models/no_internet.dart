import 'package:json_annotation/json_annotation.dart';

part 'no_internet.g.dart';

/// Model for noInternet event
@JsonSerializable()
class NoInternetData {
  final String message;
  final int? retryAfter;

  NoInternetData({
    required this.message,
    this.retryAfter,
  });

  factory NoInternetData.fromJson(Map<String, dynamic> json) =>
      _$NoInternetDataFromJson(json);

  Map<String, dynamic> toJson() => _$NoInternetDataToJson(this);
}
