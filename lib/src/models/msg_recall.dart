import 'package:json_annotation/json_annotation.dart';

part 'msg_recall.g.dart';

/// Model for msgRecall event
@JsonSerializable()
class MsgRecallData {
  final String messageId;
  final String roomId;
  final String userId;
  final int timestamp;
  final String? reason;

  MsgRecallData({
    required this.messageId,
    required this.roomId,
    required this.userId,
    required this.timestamp,
    this.reason,
  });

  factory MsgRecallData.fromJson(Map<String, dynamic> json) =>
      _$MsgRecallDataFromJson(json);

  Map<String, dynamic> toJson() => _$MsgRecallDataToJson(this);
}
