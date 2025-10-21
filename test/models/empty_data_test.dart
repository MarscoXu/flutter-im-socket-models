import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_im_socket_models/src/models/empty_data.dart';

void main() {
  group('EmptyData', () {
    test('should create instance', () {
      const data = EmptyData();
      expect(data, isA<EmptyData>());
    });

    test('should serialize to JSON', () {
      const data = EmptyData();
      final json = data.toJson();
      expect(json, isA<Map<String, dynamic>>());
    });

    test('should deserialize from JSON', () {
      final json = <String, dynamic>{};
      final data = EmptyData.fromJson(json);
      expect(data, isA<EmptyData>());
    });

    test('toString should return correct format', () {
      const data = EmptyData();
      expect(data.toString(), 'EmptyData()');
    });
  });
}
