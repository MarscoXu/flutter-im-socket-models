import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_im_socket_models/src/socket_envelope.dart';

void main() {
  group('SocketEnvelope', () {
    test('should create envelope with type and data', () {
      const envelope = SocketEnvelope(
        type: 'testType',
        data: {'key': 'value'},
      );

      expect(envelope.type, 'testType');
      expect(envelope.data, {'key': 'value'});
    });

    test('should parse from raw JSON string', () {
      const rawJson = '{"type":"receiveMessage","data":{"messageId":"123"}}';
      final envelope = SocketEnvelope.fromRaw(rawJson);

      expect(envelope.type, 'receiveMessage');
      expect(envelope.data, isA<Map>());
      expect(envelope.data['messageId'], '123');
    });

    test('should convert to JSON', () {
      const envelope = SocketEnvelope(
        type: 'testType',
        data: {'key': 'value'},
      );

      final json = envelope.toJson();
      expect(json['type'], 'testType');
      expect(json['data'], {'key': 'value'});
    });

    test('toString should include type and data', () {
      const envelope = SocketEnvelope(
        type: 'testType',
        data: 'testData',
      );

      final str = envelope.toString();
      expect(str, contains('testType'));
      expect(str, contains('testData'));
    });

    test('should handle null data', () {
      const envelope = SocketEnvelope(type: 'testType');
      expect(envelope.type, 'testType');
      expect(envelope.data, isNull);
    });
  });
}
