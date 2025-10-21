import 'package:test/test.dart';
import 'package:flutter_im_socket_models/src/models/login_success.dart';

void main() {
  group('LoginSuccessData', () {
    final testJson = {
      'userId': 'user123',
      'userName': 'John Doe',
      'avatar': 'https://example.com/avatar.jpg',
      'token': 'token_abc123',
      'expiresIn': 3600,
    };

    test('fromJson deserializes correctly', () {
      final data = LoginSuccessData.fromJson(testJson);
      expect(data.userId, 'user123');
      expect(data.userName, 'John Doe');
      expect(data.avatar, 'https://example.com/avatar.jpg');
      expect(data.token, 'token_abc123');
      expect(data.expiresIn, 3600);
    });

    test('toJson serializes correctly', () {
      final data = LoginSuccessData(
        userId: 'user123',
        userName: 'John Doe',
        avatar: 'https://example.com/avatar.jpg',
        token: 'token_abc123',
        expiresIn: 3600,
      );
      final json = data.toJson();
      expect(json['userId'], 'user123');
      expect(json['userName'], 'John Doe');
      expect(json['token'], 'token_abc123');
    });

    test('round-trip serialization', () {
      final original = LoginSuccessData.fromJson(testJson);
      final json = original.toJson();
      final deserialized = LoginSuccessData.fromJson(json);
      expect(deserialized.userId, original.userId);
      expect(deserialized.token, original.token);
    });
  });
}
