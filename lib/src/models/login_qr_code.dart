import 'package:json_annotation/json_annotation.dart';

part 'login_qr_code.g.dart';

/// 登录二维码数据模型
@JsonSerializable()
class LoginQrCodeData {
  final String? qrCode;
  final String? qrCodeUrl;
  final int? expireTime;
  final String? sessionId;

  const LoginQrCodeData({
    this.qrCode,
    this.qrCodeUrl,
    this.expireTime,
    this.sessionId,
  });

  factory LoginQrCodeData.fromJson(Map<String, dynamic> json) =>
      _$LoginQrCodeDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoginQrCodeDataToJson(this);

  @override
  String toString() => 'LoginQrCodeData(qrCode: $qrCode, expireTime: $expireTime)';
}
