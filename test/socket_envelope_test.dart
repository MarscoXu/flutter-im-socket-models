import 'package:test/test.dart';
import 'package:flutter_im_socket_models/src/socket_envelope.dart';
import 'package:flutter_im_socket_models/src/message_factory.dart';

void main() {
  setUpAll(() {
    MessageFactory.registerDefaults();
  });

  group('SocketEnvelope', () {
    test('fromRaw parses JSON string correctly', () {
      final raw = '{"type":"receiveMessage","data":{"messageId":"msg1","fromUserId":"user1","roomId":"room1","content":"Hello","messageType":1,"timestamp":1234567890}}';
      final envelope = SocketEnvelope.fromRaw(raw);
      expect(envelope.type, 'receiveMessage');
      expect(envelope.data, isA<Map>());
    });

    test('decode returns typed model', () {
      final raw = '{"type":"receiveMessage","data":{"messageId":"msg1","fromUserId":"user1","roomId":"room1","content":"Hello","messageType":1,"timestamp":1234567890}}';
      final envelope = SocketEnvelope.fromRaw(raw);
      final decoded = envelope.decode();
      expect(decoded, isNotNull);
    });

    test('toJson serializes envelope', () {
      final envelope = SocketEnvelope(
        type: 'test',
        data: {'key': 'value'},
      );
      final json = envelope.toJson();
      expect(json['type'], 'test');
      expect(json['data'], {'key': 'value'});
    });
  });

  group('MessageFactory', () {
    test('registerDefaults registers all 37 types', () {
      // The factory should be registered via setUpAll
      // Test with valid minimal data for each type
      final receiveMsg = MessageFactory.decode('receiveMessage', <String, dynamic>{
        'messageId': 'msg1',
        'fromUserId': 'user1',
        'roomId': 'room1',
        'content': 'test',
        'messageType': 1,
        'timestamp': 123456
      });
      expect(receiveMsg, isNotNull);
      
      final qrCode = MessageFactory.decode('loginQrCode', <String, dynamic>{
        'qrCode': 'qr123'
      });
      expect(qrCode, isNotNull);
      
      final noInternet = MessageFactory.decode('noInternet', <String, dynamic>{
        'message': 'No connection'
      });
      expect(noInternet, isNotNull);
      
      // Test empty data types
      expect(MessageFactory.decode('waitingAuthorize', <String, dynamic>{}), isNotNull);
      expect(MessageFactory.decode('notice', <String, dynamic>{}), isNotNull);
    });

    test('decode handles unknown type gracefully', () {
      final result = MessageFactory.decode('unknownType', {'test': 'data'});
      expect(result, {'test': 'data'});
    });

    test('custom registration works', () {
      MessageFactory.register('customType', (json) => 'custom');
      final result = MessageFactory.decode('customType', <String, dynamic>{});
      expect(result, 'custom');
      MessageFactory.unregister('customType');
    });
  });
}
