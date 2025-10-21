import 'package:test/test.dart';
import 'package:flutter_im_socket_models/src/models/receive_message.dart';

void main() {
  group('ReceiveMessageData', () {
    final testJson = {
      'messageId': 'msg123',
      'fromUserId': 'user456',
      'fromUserName': 'John Doe',
      'fromUserAvatar': 'https://example.com/avatar.jpg',
      'roomId': 'room789',
      'content': 'Hello, World!',
      'messageType': 1,
      'timestamp': 1634567890,
      'extra': {'key': 'value'},
    };

    test('fromJson deserializes correctly', () {
      final data = ReceiveMessageData.fromJson(testJson);
      expect(data.messageId, 'msg123');
      expect(data.fromUserId, 'user456');
      expect(data.fromUserName, 'John Doe');
      expect(data.fromUserAvatar, 'https://example.com/avatar.jpg');
      expect(data.roomId, 'room789');
      expect(data.content, 'Hello, World!');
      expect(data.messageType, 1);
      expect(data.timestamp, 1634567890);
      expect(data.extra, {'key': 'value'});
    });

    test('toJson serializes correctly', () {
      final data = ReceiveMessageData(
        messageId: 'msg123',
        fromUserId: 'user456',
        fromUserName: 'John Doe',
        fromUserAvatar: 'https://example.com/avatar.jpg',
        roomId: 'room789',
        content: 'Hello, World!',
        messageType: 1,
        timestamp: 1634567890,
        extra: {'key': 'value'},
      );
      final json = data.toJson();
      expect(json['messageId'], 'msg123');
      expect(json['fromUserId'], 'user456');
      expect(json['content'], 'Hello, World!');
    });

    test('round-trip serialization preserves data', () {
      final original = ReceiveMessageData.fromJson(testJson);
      final json = original.toJson();
      final deserialized = ReceiveMessageData.fromJson(json);
      expect(deserialized.messageId, original.messageId);
      expect(deserialized.content, original.content);
    });

    test('handles null optional fields', () {
      final minimalJson = {
        'messageId': 'msg123',
        'fromUserId': 'user456',
        'roomId': 'room789',
        'content': 'Hello',
        'messageType': 1,
        'timestamp': 1634567890,
      };
      final data = ReceiveMessageData.fromJson(minimalJson);
      expect(data.fromUserName, isNull);
      expect(data.fromUserAvatar, isNull);
      expect(data.extra, isNull);
    });
  });
}
