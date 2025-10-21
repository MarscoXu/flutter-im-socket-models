import 'package:test/test.dart';
import 'package:flutter_im_socket_models/src/models/login_qr_code.dart';

void main() {
  group('LoginQrCodeData', () {
    final testJson = {
      'qrCode': 'QR123456',
      'qrCodeUrl': 'https://example.com/qr',
      'expiresIn': 300,
    };

    test('fromJson deserializes correctly', () {
      final data = LoginQrCodeData.fromJson(testJson);
      expect(data.qrCode, 'QR123456');
      expect(data.qrCodeUrl, 'https://example.com/qr');
      expect(data.expiresIn, 300);
    });

    test('toJson serializes correctly', () {
      final data = LoginQrCodeData(
        qrCode: 'QR123456',
        qrCodeUrl: 'https://example.com/qr',
        expiresIn: 300,
      );
      final json = data.toJson();
      expect(json['qrCode'], 'QR123456');
      expect(json['qrCodeUrl'], 'https://example.com/qr');
      expect(json['expiresIn'], 300);
    });

    test('round-trip serialization', () {
      final original = LoginQrCodeData.fromJson(testJson);
      final json = original.toJson();
      final deserialized = LoginQrCodeData.fromJson(json);
      expect(deserialized.qrCode, original.qrCode);
      expect(deserialized.qrCodeUrl, original.qrCodeUrl);
      expect(deserialized.expiresIn, original.expiresIn);
    });

    test('handles null optional fields', () {
      final minimalJson = {'qrCode': 'QR123456'};
      final data = LoginQrCodeData.fromJson(minimalJson);
      expect(data.qrCode, 'QR123456');
      expect(data.qrCodeUrl, isNull);
      expect(data.expiresIn, isNull);
    });
  });
}
