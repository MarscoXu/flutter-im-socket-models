import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_im_socket_models/src/models/login_success.dart';

void main() {
  group('LoginSuccessData', () {
    test('should create instance with all fields', () {
      final data = LoginSuccessData(
        userId: 'user123',
        token: 'token456',
        username: 'testuser',
        avatar: 'https://example.com/avatar.jpg',
        userInfo: {'role': 'admin'},
        timestamp: 1234567890,
      );

      expect(data.userId, 'user123');
      expect(data.token, 'token456');
      expect(data.username, 'testuser');
      expect(data.avatar, 'https://example.com/avatar.jpg');
      expect(data.userInfo, {'role': 'admin'});
      expect(data.timestamp, 1234567890);
    });

    test('should serialize to JSON', () {
      const data = LoginSuccessData(
        userId: 'user123',
        username: 'testuser',
      );
      final json = data.toJson();
      
      expect(json['userId'], 'user123');
      expect(json['username'], 'testuser');
    });

    test('should deserialize from JSON', () {
      final json = {
        'userId': 'user123',
        'token': 'abc123',
        'username': 'john_doe',
        'avatar': 'avatar.jpg',
        'timestamp': 1234567890,
      };

      final data = LoginSuccessData.fromJson(json);
      expect(data.userId, 'user123');
      expect(data.token, 'abc123');
      expect(data.username, 'john_doe');
    });
  });
}
