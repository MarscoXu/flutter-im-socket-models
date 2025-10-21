import 'package:json_annotation/json_annotation.dart';

part 'member_change.g.dart';

/// 成员变更数据模型
@JsonSerializable()
class MemberChangeData {
  final String? roomId;
  final String? userId;
  final String? changeType;
  final String? operatorId;
  final String? reason;
  final int? timestamp;
  final Map<String, dynamic>? userInfo;

  const MemberChangeData({
    this.roomId,
    this.userId,
    this.changeType,
    this.operatorId,
    this.reason,
    this.timestamp,
    this.userInfo,
  });

  factory MemberChangeData.fromJson(Map<String, dynamic> json) =>
      _$MemberChangeDataFromJson(json);

  Map<String, dynamic> toJson() => _$MemberChangeDataToJson(this);

  @override
  String toString() => 'MemberChangeData(roomId: $roomId, userId: $userId, changeType: $changeType)';
}
