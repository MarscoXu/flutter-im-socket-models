import 'package:json_annotation/json_annotation.dart';

part 'no_internet.g.dart';

/// 无网络连接数据模型
@JsonSerializable()
class NoInternetData {
  final String? message;
  final int? timestamp;
  final bool? isRetrying;

  const NoInternetData({
    this.message,
    this.timestamp,
    this.isRetrying,
  });

  factory NoInternetData.fromJson(Map<String, dynamic> json) =>
      _$NoInternetDataFromJson(json);

  Map<String, dynamic> toJson() => _$NoInternetDataToJson(this);

  @override
  String toString() => 'NoInternetData(message: $message, isRetrying: $isRetrying)';
}
