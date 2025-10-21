import 'package:test/test.dart';
import 'package:flutter_im_socket_models/src/models/member_change.dart';

void main() {
  group('MemberChangeData', () {
    final testJson = {
      'roomId': 'room123',
      'userId': 'user456',
      'changeType': 'add',
      'operatorId': 'user789',
      'timestamp': 1634567890,
    };

    test('fromJson deserializes correctly', () {
      final data = MemberChangeData.fromJson(testJson);
      expect(data.roomId, 'room123');
      expect(data.userId, 'user456');
      expect(data.changeType, 'add');
      expect(data.operatorId, 'user789');
      expect(data.timestamp, 1634567890);
    });

    test('toJson serializes correctly', () {
      final data = MemberChangeData(
        roomId: 'room123',
        userId: 'user456',
        changeType: 'add',
        operatorId: 'user789',
        timestamp: 1634567890,
      );
      final json = data.toJson();
      expect(json['roomId'], 'room123');
      expect(json['userId'], 'user456');
      expect(json['changeType'], 'add');
    });

    test('round-trip serialization', () {
      final original = MemberChangeData.fromJson(testJson);
      final json = original.toJson();
      final deserialized = MemberChangeData.fromJson(json);
      expect(deserialized.roomId, original.roomId);
      expect(deserialized.changeType, original.changeType);
    });
  });
}
