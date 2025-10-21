import 'package:json_annotation/json_annotation.dart';

part 'new_apply.g.dart';

/// 新申请数据模型
@JsonSerializable()
class NewApplyData {
  final String? applyId;
  final String? applicantId;
  final String? targetId;
  final String? applyType;
  final String? message;
  final String? status;
  final int? timestamp;

  const NewApplyData({
    this.applyId,
    this.applicantId,
    this.targetId,
    this.applyType,
    this.message,
    this.status,
    this.timestamp,
  });

  factory NewApplyData.fromJson(Map<String, dynamic> json) =>
      _$NewApplyDataFromJson(json);

  Map<String, dynamic> toJson() => _$NewApplyDataToJson(this);

  @override
  String toString() => 'NewApplyData(applyId: $applyId, applyType: $applyType)';
}
