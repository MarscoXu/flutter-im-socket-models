// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_qr_code.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginQrCodeData _$LoginQrCodeDataFromJson(Map<String, dynamic> json) =>
    LoginQrCodeData(
      qrCode: json['qrCode'] as String?,
      qrCodeUrl: json['qrCodeUrl'] as String?,
      expireTime: json['expireTime'] as int?,
      sessionId: json['sessionId'] as String?,
    );

Map<String, dynamic> _$LoginQrCodeDataToJson(LoginQrCodeData instance) =>
    <String, dynamic>{
      'qrCode': instance.qrCode,
      'qrCodeUrl': instance.qrCodeUrl,
      'expireTime': instance.expireTime,
      'sessionId': instance.sessionId,
    };
