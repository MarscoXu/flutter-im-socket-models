/// Example of using flutter_im_socket_models library
/// 
/// This example demonstrates:
/// 1. Using WebSocketMessage.fromJson() to parse messages
/// 2. Accessing typed model data
/// 3. Handling different message types

import 'package:flutter_im_socket_models/flutter_im_socket_models.dart';

void main() {
  // Initialize the message factory
  MessageFactory.registerDefaults();

  // Example 1: Parse a receiveMessage
  print('=== Example 1: Receive Message ===');
  final receiveMessageJson = {
    'type': 'receiveMessage',
    'data': {
      'messageId': 'msg_001',
      'roomId': 'room_123',
      'senderId': 'user_456',
      'content': 'Hello, this is a test message!',
      'messageType': 'text',
      'timestamp': 1697894400000,
    }
  };

  final receivedMessage = WebSocketMessage.fromJson(receiveMessageJson);
  print('Type: ${receivedMessage.type}');
  
  if (receivedMessage.data is ReceiveMessageData) {
    final data = receivedMessage.data as ReceiveMessageData;
    print('Message ID: ${data.messageId}');
    print('Room ID: ${data.roomId}');
    print('Sender: ${data.senderId}');
    print('Content: ${data.content}');
    print('Type: ${data.messageType}');
  }

  // Example 2: Parse a loginSuccess message
  print('\n=== Example 2: Login Success ===');
  final loginSuccessJson = {
    'type': 'loginSuccess',
    'data': {
      'userId': 'user_789',
      'username': 'john_doe',
      'nickname': 'John',
      'avatar': 'https://example.com/avatar.jpg',
      'token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...',
      'expireTime': 1697980800000,
    }
  };

  final loginMessage = WebSocketMessage.fromJson(loginSuccessJson);
  print('Type: ${loginMessage.type}');
  
  if (loginMessage.data is LoginSuccessData) {
    final data = loginMessage.data as LoginSuccessData;
    print('User ID: ${data.userId}');
    print('Username: ${data.username}');
    print('Nickname: ${data.nickname}');
    print('Token: ${data.token?.substring(0, 20)}...');
  }

  // Example 3: Parse an online notification
  print('\n=== Example 3: Online Notification ===');
  final onlineJson = {
    'type': 'online',
    'data': {
      'userId': 'user_111',
      'username': 'alice',
      'timestamp': 1697894500000,
      'status': 'online'
    }
  };

  final onlineMessage = WebSocketMessage.fromJson(onlineJson);
  print('Type: ${onlineMessage.type}');
  
  if (onlineMessage.data is OnlineOfflineData) {
    final data = onlineMessage.data as OnlineOfflineData;
    print('User: ${data.username} (${data.userId})');
    print('Status: ${data.status}');
  }

  // Example 4: Parse a room info change
  print('\n=== Example 4: Room Info Change ===');
  final roomInfoChangeJson = {
    'type': 'roomInfoChange',
    'data': {
      'roomId': 'room_999',
      'roomName': 'New Room Name',
      'announcement': 'Welcome to our group!',
      'operatorId': 'user_admin',
      'timestamp': 1697894600000,
    }
  };

  final roomMessage = WebSocketMessage.fromJson(roomInfoChangeJson);
  print('Type: ${roomMessage.type}');
  
  if (roomMessage.data is RoomInfoChangeData) {
    final data = roomMessage.data as RoomInfoChangeData;
    print('Room ID: ${data.roomId}');
    print('New Name: ${data.roomName}');
    print('Announcement: ${data.announcement}');
    print('Changed by: ${data.operatorId}');
  }

  // Example 5: Parse a message recall
  print('\n=== Example 5: Message Recall ===');
  final msgRecallJson = {
    'type': 'msgRecall',
    'data': {
      'messageId': 'msg_002',
      'roomId': 'room_123',
      'operatorId': 'user_456',
      'timestamp': 1697894700000,
      'reason': 'User requested deletion'
    }
  };

  final recallMessage = WebSocketMessage.fromJson(msgRecallJson);
  print('Type: ${recallMessage.type}');
  
  if (recallMessage.data is MsgRecallData) {
    final data = recallMessage.data as MsgRecallData;
    print('Recalled Message ID: ${data.messageId}');
    print('Room ID: ${data.roomId}');
    print('Recalled by: ${data.operatorId}');
    print('Reason: ${data.reason}');
  }

  // Example 6: Parse a member change
  print('\n=== Example 6: Member Change ===');
  final memberChangeJson = {
    'type': 'memberChange',
    'data': {
      'roomId': 'room_123',
      'changeType': 'add',
      'userIds': ['user_new1', 'user_new2'],
      'operatorId': 'user_admin',
      'timestamp': 1697894800000,
    }
  };

  final memberMessage = WebSocketMessage.fromJson(memberChangeJson);
  print('Type: ${memberMessage.type}');
  
  if (memberMessage.data is MemberChangeData) {
    final data = memberMessage.data as MemberChangeData;
    print('Room ID: ${data.roomId}');
    print('Change Type: ${data.changeType}');
    print('Users: ${data.userIds?.join(", ")}');
    print('Operator: ${data.operatorId}');
  }

  // Example 7: Parse a message with EmptyData (waitingAuthorize)
  print('\n=== Example 7: Waiting Authorize (EmptyData) ===');
  final waitingJson = {
    'type': 'waitingAuthorize',
    'data': {}
  };

  final waitingMessage = WebSocketMessage.fromJson(waitingJson);
  print('Type: ${waitingMessage.type}');
  print('Data: ${waitingMessage.data}');

  print('\n=== All examples completed successfully! ===');
}
