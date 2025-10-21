import 'package:json_annotation/json_annotation.dart';

part 'member_change.g.dart';

/// Model for memberChange event
@JsonSerializable()
class MemberChangeData {
  final String roomId;
  final String userId;
  final String changeType;
  final String? operatorId;
  final int timestamp;

  MemberChangeData({
    required this.roomId,
    required this.userId,
    required this.changeType,
    this.operatorId,
    required this.timestamp,
  });

  factory MemberChangeData.fromJson(Map<String, dynamic> json) =>
      _$MemberChangeDataFromJson(json);

  Map<String, dynamic> toJson() => _$MemberChangeDataToJson(this);
}
