import 'package:json_annotation/json_annotation.dart';

part 'msg_mark_item.g.dart';

/// Model for msgMarkItem event
@JsonSerializable()
class MsgMarkItemData {
  final String messageId;
  final String roomId;
  final String userId;
  final int markType;
  final int timestamp;

  MsgMarkItemData({
    required this.messageId,
    required this.roomId,
    required this.userId,
    required this.markType,
    required this.timestamp,
  });

  factory MsgMarkItemData.fromJson(Map<String, dynamic> json) =>
      _$MsgMarkItemDataFromJson(json);

  Map<String, dynamic> toJson() => _$MsgMarkItemDataToJson(this);
}
