import 'package:json_annotation/json_annotation.dart';

part 'msg_recall.g.dart';

/// 消息撤回数据模型
@JsonSerializable()
class MsgRecallData {
  final String? messageId;
  final String? roomId;
  final String? recallerId;
  final String? reason;
  final int? timestamp;

  const MsgRecallData({
    this.messageId,
    this.roomId,
    this.recallerId,
    this.reason,
    this.timestamp,
  });

  factory MsgRecallData.fromJson(Map<String, dynamic> json) =>
      _$MsgRecallDataFromJson(json);

  Map<String, dynamic> toJson() => _$MsgRecallDataToJson(this);

  @override
  String toString() => 'MsgRecallData(messageId: $messageId, recallerId: $recallerId)';
}
