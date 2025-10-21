import 'package:json_annotation/json_annotation.dart';

part 'new_apply.g.dart';

/// Model for newApply event
@JsonSerializable()
class NewApplyData {
  final String applyId;
  final String applyType;
  final String fromUserId;
  final String? fromUserName;
  final String? targetId;
  final String? message;
  final int timestamp;

  NewApplyData({
    required this.applyId,
    required this.applyType,
    required this.fromUserId,
    this.fromUserName,
    this.targetId,
    this.message,
    required this.timestamp,
  });

  factory NewApplyData.fromJson(Map<String, dynamic> json) =>
      _$NewApplyDataFromJson(json);

  Map<String, dynamic> toJson() => _$NewApplyDataToJson(this);
}
