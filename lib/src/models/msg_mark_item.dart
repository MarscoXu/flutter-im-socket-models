import 'package:json_annotation/json_annotation.dart';

part 'msg_mark_item.g.dart';

/// 消息标记项数据模型
@JsonSerializable()
class MsgMarkItemData {
  final String? messageId;
  final String? roomId;
  final String? userId;
  final String? markType;
  final int? timestamp;
  final Map<String, dynamic>? extra;

  const MsgMarkItemData({
    this.messageId,
    this.roomId,
    this.userId,
    this.markType,
    this.timestamp,
    this.extra,
  });

  factory MsgMarkItemData.fromJson(Map<String, dynamic> json) =>
      _$MsgMarkItemDataFromJson(json);

  Map<String, dynamic> toJson() => _$MsgMarkItemDataToJson(this);

  @override
  String toString() => 'MsgMarkItemData(messageId: $messageId, markType: $markType)';
}
