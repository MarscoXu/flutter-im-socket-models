import 'package:flutter_im_socket_models/flutter_im_socket_models.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

/// Example of how to use the Flutter IM Socket Models package
void main() {
  // Initialize the message factory
  MessageFactory.registerDefaults();
  
  print('✅ MessageFactory initialized with 37 message types');
  
  // Example 1: Creating and parsing a simple envelope
  demonstrateEnvelopeParsing();
  
  // Example 2: Using specific models
  demonstrateModelUsage();
  
  // Example 3: WebSocket connection (commented out - requires actual server)
  // demonstrateSocketService();
}

/// Demonstrates parsing raw WebSocket messages
void demonstrateEnvelopeParsing() {
  print('\n=== Example 1: Envelope Parsing ===');
  
  // Simulate a raw WebSocket message
  const rawMessage = '''
  {
    "type": "receiveMessage",
    "data": {
      "messageId": "msg123",
      "roomId": "room456",
      "senderId": "user789",
      "content": "Hello from WebSocket!",
      "messageType": 1,
      "timestamp": 1234567890
    }
  }
  ''';
  
  // Parse the envelope
  final envelope = SocketEnvelope.fromRaw(rawMessage);
  print('📨 Message Type: ${envelope.type}');
  
  // Decode to specific model
  final decoded = envelope.decode();
  if (decoded is ReceiveMessageData) {
    print('💬 Message Content: ${decoded.content}');
    print('👤 Sender ID: ${decoded.senderId}');
    print('🏠 Room ID: ${decoded.roomId}');
  }
}

/// Demonstrates creating and using specific models
void demonstrateModelUsage() {
  print('\n=== Example 2: Model Creation ===');
  
  // Create a login success model
  final loginData = LoginSuccessData(
    userId: 'user123',
    token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...',
    username: 'john_doe',
    avatar: 'https://example.com/avatar.jpg',
    timestamp: DateTime.now().millisecondsSinceEpoch,
  );
  
  print('✅ Login successful:');
  print('   User: ${loginData.username}');
  print('   ID: ${loginData.userId}');
  
  // Convert to JSON
  final json = loginData.toJson();
  print('📤 JSON: ${json['username']} - Token: ${json['token']?.substring(0, 20)}...');
  
  // Parse back from JSON
  final restored = LoginSuccessData.fromJson(json);
  print('📥 Restored: ${restored.username}');
  
  // Example with online status
  print('\n📡 User Status Update:');
  final statusData = OnlineOfflineData(
    userId: 'user456',
    status: 'online',
    timestamp: DateTime.now().millisecondsSinceEpoch,
    deviceId: 'device-mobile-001',
  );
  print('   User ${statusData.userId} is now ${statusData.status}');
  
  // Example with room info change
  print('\n🏠 Room Update:');
  final roomChange = RoomInfoChangeData(
    roomId: 'room789',
    roomName: 'Project Discussion',
    changeType: 'name_changed',
    announcement: 'Welcome to our project room!',
    timestamp: DateTime.now().millisecondsSinceEpoch,
  );
  print('   Room "${roomChange.roomName}" was updated');
  print('   Change: ${roomChange.changeType}');
}

/// Demonstrates using the SocketService (requires actual WebSocket connection)
void demonstrateSocketService() {
  print('\n=== Example 3: Socket Service ===');
  
  // Connect to WebSocket server
  final channel = WebSocketChannel.connect(
    Uri.parse('wss://your-websocket-server.com'),
  );
  
  // Create socket service
  final socketService = SocketService(channel);
  
  // Register event handlers
  socketService.on('receiveMessage', (type, model) {
    final message = model as ReceiveMessageData;
    print('💬 New message from ${message.senderId}: ${message.content}');
  });
  
  socketService.on('loginSuccess', (type, model) {
    final loginData = model as LoginSuccessData;
    print('✅ Login successful: ${loginData.username}');
  });
  
  socketService.on('online', (type, model) {
    final statusData = model as OnlineOfflineData;
    print('📡 User ${statusData.userId} came online');
  });
  
  socketService.on('roomInfoChange', (type, model) {
    final roomData = model as RoomInfoChangeData;
    print('🏠 Room ${roomData.roomId} was updated: ${roomData.changeType}');
  });
  
  // Send a message
  socketService.sendJson({
    'type': 'sendMessage',
    'data': {
      'roomId': 'room123',
      'content': 'Hello everyone!',
      'messageType': 1,
    },
  });
  
  print('📤 Message sent to room');
  
  // Clean up when done
  // socketService.dispose();
}

/// Example of handling all 37 message types
void demonstrateAllMessageTypes() {
  print('\n=== All 37 Message Types ===');
  
  final types = {
    'Authentication': ['loginQrCode', 'waitingAuthorize', 'loginSuccess', 'tokenExpired', 'invalidUser'],
    'Messaging': ['receiveMessage', 'msgMarkItem', 'msgRecall', 'notice'],
    'User Status': ['online', 'offline', 'userStateChange'],
    'Room Management': ['roomInfoChange', 'myRoomInfoChange', 'roomDissolution', 'roomGroupMsg', 'roomNotification', 'roomGroupNoticeReadMsg', 'memberChange'],
    'Friend Requests': ['requestApprovalFriend', 'newApply', 'GroupApplyNotice'],
    'Privacy': ['shield', 'unblock'],
    'Connection': ['noInternet', 'WSReconnect'],
    'Video Calling': ['JoinVideo', 'VideoCallRequest', 'StartSignaling', 'CallAccepted', 'CallRejected', 'RoomClosed', 'MediaControl'],
    'Call Status': ['TIMEOUT', 'CANCEL', 'DROPPED'],
    'Other': ['feedSendMsg'],
  };
  
  types.forEach((category, messageTypes) {
    print('\n$category:');
    for (final type in messageTypes) {
      print('  - $type');
    }
  });
  
  print('\n✅ Total: ${types.values.expand((e) => e).length} message types supported');
}
