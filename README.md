# Flutter IM Socket Models

A Dart package for handling WebSocket message models in Flutter instant messaging applications. This package provides type-safe models with JSON serialization support for 37 different message types.

## Features

- 🎯 Type-safe models for 37 WebSocket message types
- 🔄 Automatic JSON serialization/deserialization using `json_serializable`
- 📦 Message envelope wrapper for WebSocket messages
- 🏭 Message factory pattern for automatic message type resolution
- 🔌 Built-in WebSocket service wrapper
- ✅ Comprehensive test coverage

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  flutter_im_socket_models:
    git:
      url: https://github.com/MarscoXu/flutter-im-socket-models.git
```

Then run:

```bash
flutter pub get
```

## Usage

### Basic Usage

```dart
import 'package:flutter_im_socket_models/flutter_im_socket_models.dart';

// Register all message types
MessageFactory.registerDefaults();

// Parse incoming WebSocket message
final envelope = SocketEnvelope.fromRaw(rawJsonString);
final message = envelope.decode();

// Handle specific message type
if (message is ReceiveMessageData) {
  print('Received message: ${message.content}');
}
```

### Using SocketService

```dart
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:flutter_im_socket_models/flutter_im_socket_models.dart';

// Initialize WebSocket connection
final channel = WebSocketChannel.connect(Uri.parse('wss://example.com'));
final socketService = SocketService(channel);

// Register message handlers
socketService.on('receiveMessage', (type, data) {
  if (data is ReceiveMessageData) {
    print('Message from ${data.fromUserName}: ${data.content}');
  }
});

socketService.on('loginSuccess', (type, data) {
  if (data is LoginSuccessData) {
    print('Logged in as ${data.userName}');
  }
});

// Send messages
socketService.sendJson({
  'type': 'sendMessage',
  'data': {'content': 'Hello!'}
});
```

### Working with Models

```dart
// Create a message model
final message = ReceiveMessageData(
  messageId: 'msg123',
  fromUserId: 'user456',
  roomId: 'room789',
  content: 'Hello, World!',
  messageType: 1,
  timestamp: DateTime.now().millisecondsSinceEpoch,
);

// Serialize to JSON
final json = message.toJson();

// Deserialize from JSON
final decoded = ReceiveMessageData.fromJson(json);
```

## Supported Message Types

The package handles 37 different WebSocket message types:

### Authentication & Connection
- `loginQrCode` - QR code login data
- `waitingAuthorize` - Waiting for authorization
- `loginSuccess` - Successful login
- `tokenExpired` - Token expiration notice
- `invalidUser` - Invalid user error
- `noInternet` - No internet connection

### Messages
- `receiveMessage` - Incoming message
- `msgMarkItem` - Message marked/reacted
- `msgRecall` - Message recalled/deleted

### User Status
- `online` - User online status
- `offline` - User offline status
- `userStateChange` - User state changed

### Room/Group Management
- `roomInfoChange` - Room information changed
- `myRoomInfoChange` - My room information changed
- `roomDissolution` - Room dissolved
- `memberChange` - Member joined/left room
- `roomGroupMsg` - Group message
- `roomGroupNoticeReadMsg` - Group notice read
- `roomNotification` - Room notification

### Friend Management
- `requestApprovalFriend` - Friend request
- `newApply` - New application
- `GroupApplyNotice` - Group application notice

### Other Features
- `notice` - General notice
- `feedSendMsg` - Feed message sent
- `shield` - User blocked
- `unblock` - User unblocked
- `WSReconnect` - WebSocket reconnection

### Video Calling
- `JoinVideo` - Join video call
- `VideoCallRequest` - Video call request
- `StartSignaling` - Start signaling
- `CallAccepted` - Call accepted
- `CallRejected` - Call rejected
- `RoomClosed` - Video room closed
- `MediaControl` - Media control
- `TIMEOUT` - Call timeout
- `CANCEL` - Call cancelled
- `DROPPED` - Call dropped

## Model Structure

All models follow a consistent pattern:

```dart
@JsonSerializable()
class ModelNameData {
  final String requiredField;
  final String? optionalField;

  ModelNameData({
    required this.requiredField,
    this.optionalField,
  });

  factory ModelNameData.fromJson(Map<String, dynamic> json) =>
      _$ModelNameDataFromJson(json);

  Map<String, dynamic> toJson() => _$ModelNameDataToJson(this);
}
```

## Development

### Building

Generate serialization code:

```bash
dart run build_runner build --delete-conflicting-outputs
```

### Testing

Run all tests:

```bash
dart test
```

### Code Analysis

Check code quality:

```bash
dart analyze
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License.

## Authors

- MarscoXu

## Repository

https://github.com/MarscoXu/flutter-im-socket-models.git
