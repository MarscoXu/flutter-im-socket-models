import 'package:json_annotation/json_annotation.dart';

part 'online_offline.g.dart';

/// Model for online/offline events
@JsonSerializable()
class OnlineOfflineData {
  final String userId;
  final String status;
  final int timestamp;

  OnlineOfflineData({
    required this.userId,
    required this.status,
    required this.timestamp,
  });

  factory OnlineOfflineData.fromJson(Map<String, dynamic> json) =>
      _$OnlineOfflineDataFromJson(json);

  Map<String, dynamic> toJson() => _$OnlineOfflineDataToJson(this);
}
