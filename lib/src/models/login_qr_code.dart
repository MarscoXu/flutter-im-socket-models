import 'package:json_annotation/json_annotation.dart';

part 'login_qr_code.g.dart';

/// Model for loginQrCode event
@JsonSerializable()
class LoginQrCodeData {
  final String qrCode;
  final String? qrCodeUrl;
  final int? expiresIn;

  LoginQrCodeData({
    required this.qrCode,
    this.qrCodeUrl,
    this.expiresIn,
  });

  factory LoginQrCodeData.fromJson(Map<String, dynamic> json) =>
      _$LoginQrCodeDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoginQrCodeDataToJson(this);
}
