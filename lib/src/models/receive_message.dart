import 'package:json_annotation/json_annotation.dart';

part 'receive_message.g.dart';

/// Model for receiveMessage event
@JsonSerializable()
class ReceiveMessageData {
  final String messageId;
  final String fromUserId;
  final String? fromUserName;
  final String? fromUserAvatar;
  final String roomId;
  final String content;
  final int messageType;
  final int timestamp;
  final Map<String, dynamic>? extra;

  ReceiveMessageData({
    required this.messageId,
    required this.fromUserId,
    this.fromUserName,
    this.fromUserAvatar,
    required this.roomId,
    required this.content,
    required this.messageType,
    required this.timestamp,
    this.extra,
  });

  factory ReceiveMessageData.fromJson(Map<String, dynamic> json) =>
      _$ReceiveMessageDataFromJson(json);

  Map<String, dynamic> toJson() => _$ReceiveMessageDataToJson(this);
}
