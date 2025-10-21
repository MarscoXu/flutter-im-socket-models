import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_im_socket_models/flutter_im_socket_models.dart';

void main() {
  group('Integration Tests', () {
    setUp(() {
      MessageFactory.registerDefaults();
    });

    test('should parse and decode receiveMessage envelope', () {
      const rawMessage = '''
      {
        "type": "receiveMessage",
        "data": {
          "messageId": "msg123",
          "roomId": "room456",
          "senderId": "user789",
          "content": "Hello World",
          "messageType": 1,
          "timestamp": 1234567890
        }
      }
      ''';

      final envelope = SocketEnvelope.fromRaw(rawMessage);
      expect(envelope.type, 'receiveMessage');

      final decoded = envelope.decode();
      expect(decoded, isA<ReceiveMessageData>());

      final message = decoded as ReceiveMessageData;
      expect(message.messageId, 'msg123');
      expect(message.content, 'Hello World');
    });

    test('should parse and decode loginSuccess envelope', () {
      const rawMessage = '''
      {
        "type": "loginSuccess",
        "data": {
          "userId": "user123",
          "token": "token456",
          "username": "john_doe",
          "timestamp": 1234567890
        }
      }
      ''';

      final envelope = SocketEnvelope.fromRaw(rawMessage);
      final decoded = envelope.decode();
      expect(decoded, isA<LoginSuccessData>());

      final loginData = decoded as LoginSuccessData;
      expect(loginData.userId, 'user123');
      expect(loginData.username, 'john_doe');
    });

    test('should parse and decode online status envelope', () {
      const rawMessage = '''
      {
        "type": "online",
        "data": {
          "userId": "user123",
          "status": "online",
          "timestamp": 1234567890
        }
      }
      ''';

      final envelope = SocketEnvelope.fromRaw(rawMessage);
      final decoded = envelope.decode();
      expect(decoded, isA<OnlineOfflineData>());
    });

    test('should parse and decode empty data types', () {
      const rawMessage = '''
      {
        "type": "notice",
        "data": {}
      }
      ''';

      final envelope = SocketEnvelope.fromRaw(rawMessage);
      final decoded = envelope.decode();
      expect(decoded, isA<EmptyData>());
    });

    test('should handle all 37 registered message types', () {
      final types = [
        'receiveMessage',
        'loginQrCode',
        'noInternet',
        'waitingAuthorize',
        'loginSuccess',
        'online',
        'offline',
        'userStateChange',
        'roomInfoChange',
        'myRoomInfoChange',
        'tokenExpired',
        'invalidUser',
        'msgMarkItem',
        'msgRecall',
        'notice',
        'requestApprovalFriend',
        'newApply',
        'roomDissolution',
        'roomGroupMsg',
        'GroupApplyNotice',
        'roomGroupNoticeReadMsg',
        'feedSendMsg',
        'roomNotification',
        'shield',
        'unblock',
        'memberChange',
        'WSReconnect',
        'JoinVideo',
        'VideoCallRequest',
        'StartSignaling',
        'CallAccepted',
        'CallRejected',
        'RoomClosed',
        'MediaControl',
        'TIMEOUT',
        'CANCEL',
        'DROPPED',
      ];

      for (final type in types) {
        final result = MessageFactory.decode(type, {});
        expect(result, isNotNull, reason: 'Type $type should be registered');
      }

      expect(types.length, 37, reason: 'Should have exactly 37 message types');
    });

    test('should handle complex nested data structures', () {
      const rawMessage = '''
      {
        "type": "receiveMessage",
        "data": {
          "messageId": "msg123",
          "roomId": "room456",
          "senderId": "user789",
          "content": "Test message",
          "extra": {
            "mentions": ["user1", "user2"],
            "attachments": [
              {"type": "image", "url": "https://example.com/image.jpg"}
            ]
          }
        }
      }
      ''';

      final envelope = SocketEnvelope.fromRaw(rawMessage);
      final decoded = envelope.decode() as ReceiveMessageData;

      expect(decoded.extra, isNotNull);
      expect(decoded.extra!['mentions'], isA<List>());
      expect(decoded.extra!['attachments'], isA<List>());
    });

    test('should roundtrip envelope to JSON and back', () {
      final originalEnvelope = SocketEnvelope(
        type: 'receiveMessage',
        data: {
          'messageId': 'msg123',
          'content': 'Hello',
        },
      );

      final json = originalEnvelope.toJson();
      final rawJson = '{"type":"${json['type']}","data":${json['data']}}';
      
      expect(json['type'], 'receiveMessage');
      expect(json['data'], isA<Map>());
    });
  });
}
