import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_im_socket_models/src/models/receive_message.dart';

void main() {
  group('ReceiveMessageData', () {
    test('should create instance with all fields', () {
      final data = ReceiveMessageData(
        messageId: 'msg123',
        roomId: 'room456',
        senderId: 'user789',
        content: 'Hello World',
        messageType: 1,
        timestamp: 1234567890,
        extra: {'key': 'value'},
      );

      expect(data.messageId, 'msg123');
      expect(data.roomId, 'room456');
      expect(data.senderId, 'user789');
      expect(data.content, 'Hello World');
      expect(data.messageType, 1);
      expect(data.timestamp, 1234567890);
      expect(data.extra, {'key': 'value'});
    });

    test('should create instance with null fields', () {
      const data = ReceiveMessageData();
      expect(data.messageId, isNull);
      expect(data.roomId, isNull);
      expect(data.senderId, isNull);
    });

    test('should serialize to JSON', () {
      const data = ReceiveMessageData(
        messageId: 'msg123',
        content: 'Test message',
      );
      final json = data.toJson();
      
      expect(json['messageId'], 'msg123');
      expect(json['content'], 'Test message');
    });

    test('should deserialize from JSON', () {
      final json = {
        'messageId': 'msg123',
        'roomId': 'room456',
        'senderId': 'user789',
        'content': 'Test content',
        'messageType': 1,
        'timestamp': 1234567890,
      };

      final data = ReceiveMessageData.fromJson(json);
      expect(data.messageId, 'msg123');
      expect(data.roomId, 'room456');
      expect(data.content, 'Test content');
    });

    test('toString should include key fields', () {
      const data = ReceiveMessageData(
        messageId: 'msg123',
        roomId: 'room456',
        senderId: 'user789',
      );
      final str = data.toString();
      expect(str, contains('msg123'));
      expect(str, contains('room456'));
      expect(str, contains('user789'));
    });
  });
}
