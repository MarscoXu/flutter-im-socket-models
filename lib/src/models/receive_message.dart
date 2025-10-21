import 'package:json_annotation/json_annotation.dart';

part 'receive_message.g.dart';

/// 接收消息数据模型
@JsonSerializable()
class ReceiveMessageData {
  final String? messageId;
  final String? roomId;
  final String? senderId;
  final String? content;
  final int? messageType;
  final int? timestamp;
  final Map<String, dynamic>? extra;

  const ReceiveMessageData({
    this.messageId,
    this.roomId,
    this.senderId,
    this.content,
    this.messageType,
    this.timestamp,
    this.extra,
  });

  factory ReceiveMessageData.fromJson(Map<String, dynamic> json) =>
      _$ReceiveMessageDataFromJson(json);

  Map<String, dynamic> toJson() => _$ReceiveMessageDataToJson(this);

  @override
  String toString() => 'ReceiveMessageData(messageId: $messageId, roomId: $roomId, senderId: $senderId)';
}
