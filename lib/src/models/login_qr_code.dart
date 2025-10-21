/// 登录二维码数据模型
class LoginQrCodeData {
  final String? qrCode;
  final String? qrCodeUrl;
  final int? expireTime;
  final String? scanId;

  LoginQrCodeData({
    this.qrCode,
    this.qrCodeUrl,
    this.expireTime,
    this.scanId,
  });

  factory LoginQrCodeData.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      return LoginQrCodeData();
    }

    return LoginQrCodeData(
      qrCode: json['qrCode'] as String?,
      qrCodeUrl: json['qrCodeUrl'] as String?,
      expireTime: json['expireTime'] as int?,
      scanId: json['scanId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (qrCode != null) 'qrCode': qrCode,
      if (qrCodeUrl != null) 'qrCodeUrl': qrCodeUrl,
      if (expireTime != null) 'expireTime': expireTime,
      if (scanId != null) 'scanId': scanId,
    };
  }

  @override
  String toString() =>
      'LoginQrCodeData(qrCode: $qrCode, qrCodeUrl: $qrCodeUrl, expireTime: $expireTime, scanId: $scanId)';
}
