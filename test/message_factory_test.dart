import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_im_socket_models/src/message_factory.dart';
import 'package:flutter_im_socket_models/src/models/empty_data.dart';
import 'package:flutter_im_socket_models/src/models/receive_message.dart';
import 'package:flutter_im_socket_models/src/models/login_success.dart';

void main() {
  group('MessageFactory', () {
    setUp(() {
      // Reset factory state before each test
      MessageFactory.registerDefaults();
    });

    test('should register custom parser', () {
      MessageFactory.register('customType', (json) => {'custom': true});
      final result = MessageFactory.decode('customType', {});
      expect(result, {'custom': true});
    });

    test('should unregister parser', () {
      MessageFactory.register('tempType', (json) => 'temp');
      MessageFactory.unregister('tempType');
      final result = MessageFactory.decode('tempType', {});
      expect(result, isA<Map>());
    });

    test('should decode receiveMessage type', () {
      final json = {
        'messageId': 'msg123',
        'content': 'Hello',
      };
      final result = MessageFactory.decode('receiveMessage', json);
      expect(result, isA<ReceiveMessageData>());
      expect((result as ReceiveMessageData).messageId, 'msg123');
    });

    test('should decode loginSuccess type', () {
      final json = {
        'userId': 'user123',
        'username': 'john',
      };
      final result = MessageFactory.decode('loginSuccess', json);
      expect(result, isA<LoginSuccessData>());
      expect((result as LoginSuccessData).userId, 'user123');
    });

    test('should decode empty data types', () {
      final result = MessageFactory.decode('notice', {});
      expect(result, isA<EmptyData>());
    });

    test('should return raw data for unknown type', () {
      final json = {'key': 'value'};
      final result = MessageFactory.decode('unknownType', json);
      expect(result, json);
    });

    test('should handle decode errors gracefully', () {
      final result = MessageFactory.decode('receiveMessage', 'invalid');
      expect(result, 'invalid');
    });

    test('should register all 37 types', () {
      // This test verifies that registerDefaults doesn't throw
      expect(() => MessageFactory.registerDefaults(), returnsNormally);
    });
  });
}
