import 'package:flutter_im_socket_models/flutter_im_socket_models.dart';

void main() {
  // Initialize the message factory
  MessageFactory.registerDefaults();
  
  print('=== Flutter IM Socket Models Example ===\n');
  
  // Example 1: Parsing a receive message
  print('Example 1: Parsing receive message');
  final receiveMessageJson = '''
  {
    "type": "receiveMessage",
    "data": {
      "messageId": "msg123",
      "fromUserId": "user456",
      "fromUserName": "John Doe",
      "roomId": "room789",
      "content": "Hello, World!",
      "messageType": 1,
      "timestamp": 1634567890
    }
  }
  ''';
  
  final envelope1 = SocketEnvelope.fromRaw(receiveMessageJson);
  final message = envelope1.decode();
  if (message is ReceiveMessageData) {
    print('Message from ${message.fromUserName}: ${message.content}');
    print('Room ID: ${message.roomId}\n');
  }
  
  // Example 2: Creating and serializing a login success model
  print('Example 2: Creating login success model');
  final loginSuccess = LoginSuccessData(
    userId: 'user123',
    userName: 'Alice',
    avatar: 'https://example.com/avatar.jpg',
    token: 'token_abc123',
    expiresIn: 3600,
  );
  
  final loginJson = loginSuccess.toJson();
  print('Login success JSON: $loginJson\n');
  
  // Example 3: Parsing a QR code login
  print('Example 3: Parsing QR code login');
  final qrCodeJson = '''
  {
    "type": "loginQrCode",
    "data": {
      "qrCode": "QR123456",
      "qrCodeUrl": "https://example.com/qr/123456",
      "expiresIn": 300
    }
  }
  ''';
  
  final envelope2 = SocketEnvelope.fromRaw(qrCodeJson);
  final qrData = envelope2.decode();
  if (qrData is LoginQrCodeData) {
    print('QR Code: ${qrData.qrCode}');
    print('Expires in: ${qrData.expiresIn} seconds\n');
  }
  
  // Example 4: Member change notification
  print('Example 4: Member change notification');
  final memberChange = MemberChangeData(
    roomId: 'room789',
    userId: 'user999',
    changeType: 'join',
    operatorId: 'user456',
    timestamp: DateTime.now().millisecondsSinceEpoch,
  );
  
  final memberChangeEnvelope = SocketEnvelope(
    type: 'memberChange',
    data: memberChange.toJson(),
  );
  
  print('Member change envelope: ${memberChangeEnvelope.toJson()}\n');
  
  // Example 5: Empty data types (like notices, reconnects)
  print('Example 5: Empty data types');
  final noticeJson = '''
  {
    "type": "notice",
    "data": {}
  }
  ''';
  
  final envelope3 = SocketEnvelope.fromRaw(noticeJson);
  final noticeData = envelope3.decode();
  print('Notice type: ${envelope3.type}');
  print('Data type: ${noticeData.runtimeType}\n');
  
  print('=== All examples completed successfully! ===');
}
