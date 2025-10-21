import 'package:test/test.dart';
import 'package:flutter_im_socket_models/src/models/empty_data.dart';

void main() {
  group('EmptyData', () {
    test('fromJson creates instance', () {
      final json = <String, dynamic>{};
      final data = EmptyData.fromJson(json);
      expect(data, isNotNull);
    });

    test('toJson returns empty map', () {
      final data = EmptyData();
      final json = data.toJson();
      expect(json, isA<Map<String, dynamic>>());
    });

    test('round-trip serialization', () {
      final original = EmptyData();
      final json = original.toJson();
      final deserialized = EmptyData.fromJson(json);
      expect(deserialized, isNotNull);
    });
  });
}
