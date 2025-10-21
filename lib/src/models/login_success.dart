/// 登录成功数据模型
class LoginSuccessData {
  final String? userId;
  final String? username;
  final String? nickname;
  final String? avatar;
  final String? token;
  final String? refreshToken;
  final int? expireTime;
  final Map<String, dynamic>? userInfo;

  LoginSuccessData({
    this.userId,
    this.username,
    this.nickname,
    this.avatar,
    this.token,
    this.refreshToken,
    this.expireTime,
    this.userInfo,
  });

  factory LoginSuccessData.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      return LoginSuccessData();
    }

    return LoginSuccessData(
      userId: json['userId'] as String?,
      username: json['username'] as String?,
      nickname: json['nickname'] as String?,
      avatar: json['avatar'] as String?,
      token: json['token'] as String?,
      refreshToken: json['refreshToken'] as String?,
      expireTime: json['expireTime'] as int?,
      userInfo: json['userInfo'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (userId != null) 'userId': userId,
      if (username != null) 'username': username,
      if (nickname != null) 'nickname': nickname,
      if (avatar != null) 'avatar': avatar,
      if (token != null) 'token': token,
      if (refreshToken != null) 'refreshToken': refreshToken,
      if (expireTime != null) 'expireTime': expireTime,
      if (userInfo != null) 'userInfo': userInfo,
    };
  }

  @override
  String toString() =>
      'LoginSuccessData(userId: $userId, username: $username, nickname: $nickname, token: $token)';
}
