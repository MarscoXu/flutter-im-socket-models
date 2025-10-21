# Flutter IM Socket Models

A comprehensive Flutter package that provides well-structured Dart models for WebSocket responses in an Instant Messaging (IM) system. This package includes 37 different message types with JSON serialization support.

## Features

- ✅ 37 comprehensive WebSocket message type models
- ✅ JSON serialization/deserialization with `json_serializable`
- ✅ Type-safe message parsing with `MessageFactory`
- ✅ Automatic message routing with `SocketService`
- ✅ Clean and maintainable code structure
- ✅ Full test coverage

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

## Code Generation

This package uses `json_serializable` for JSON serialization. After cloning or modifying models, run:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## Usage

### Basic Usage

```dart
import 'package:flutter_im_socket_models/flutter_im_socket_models.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

void main() {
  // Initialize the message factory
  MessageFactory.registerDefaults();
  
  // Connect to WebSocket
  final channel = WebSocketChannel.connect(
    Uri.parse('wss://your-websocket-server.com'),
  );
  
  // Create socket service
  final socketService = SocketService(channel);
  
  // Listen to specific message types
  socketService.on('receiveMessage', (type, model) {
    final message = model as ReceiveMessageData;
    print('Received message: ${message.content}');
  });
  
  socketService.on('loginSuccess', (type, model) {
    final loginData = model as LoginSuccessData;
    print('Login successful: ${loginData.username}');
  });
  
  // Send a message
  socketService.sendJson({
    'type': 'sendMessage',
    'data': {
      'roomId': 'room123',
      'content': 'Hello World!',
    },
  });
}
```

### Supported Message Types

The package supports 37 different WebSocket message types:

#### Authentication & User Management
- `loginQrCode` - QR code login data
- `waitingAuthorize` - Waiting for authorization
- `loginSuccess` - Successful login
- `tokenExpired` - Token expiration
- `invalidUser` - Invalid user notification

#### User Status
- `online` - User came online
- `offline` - User went offline
- `userStateChange` - User state changed

#### Messaging
- `receiveMessage` - Received a message
- `msgMarkItem` - Message mark/reaction
- `msgRecall` - Message recall/delete
- `notice` - System notice

#### Room Management
- `roomInfoChange` - Room information updated
- `myRoomInfoChange` - Personal room info updated
- `roomDissolution` - Room dissolved
- `roomGroupMsg` - Room group message
- `roomNotification` - Room notification
- `roomGroupNoticeReadMsg` - Group notice read status
- `memberChange` - Member joined/left room

#### Friend Requests
- `requestApprovalFriend` - Friend request approval
- `newApply` - New application/request
- `GroupApplyNotice` - Group application notice

#### Privacy & Blocking
- `shield` - User blocked
- `unblock` - User unblocked

#### Connection Management
- `noInternet` - No internet connection
- `WSReconnect` - WebSocket reconnection

#### Video Calling
- `JoinVideo` - Join video call
- `VideoCallRequest` - Video call request
- `StartSignaling` - Start signaling
- `CallAccepted` - Call accepted
- `CallRejected` - Call rejected
- `RoomClosed` - Video room closed
- `MediaControl` - Media control (mute/unmute)

#### Call Status
- `TIMEOUT` - Call timeout
- `CANCEL` - Call cancelled
- `DROPPED` - Call dropped

#### Other
- `feedSendMsg` - Feed message sent

## Model Structure

Each model follows this structure:

```dart
import 'package:json_annotation/json_annotation.dart';

part 'model_name.g.dart';

@JsonSerializable()
class ModelNameData {
  final String? field1;
  final int? field2;
  
  const ModelNameData({
    this.field1,
    this.field2,
  });

  factory ModelNameData.fromJson(Map<String, dynamic> json) =>
      _$ModelNameDataFromJson(json);

  Map<String, dynamic> toJson() => _$ModelNameDataToJson(this);
}
```

## Architecture

### SocketEnvelope

The `SocketEnvelope` class wraps all WebSocket messages in a standard format:

```json
{
  "type": "receiveMessage",
  "data": { ... }
}
```

### MessageFactory

The `MessageFactory` automatically decodes messages based on their type:

```dart
MessageFactory.registerDefaults(); // Register all 37 types
final model = MessageFactory.decode('receiveMessage', jsonData);
```

### SocketService

The `SocketService` provides an event-driven interface for WebSocket communication:

```dart
final service = SocketService(channel);
service.on('receiveMessage', handleMessage);
service.sendJson(data);
```

## Testing

Run tests with:

```bash
flutter test
```

## Development

To contribute or modify the package:

1. Clone the repository
2. Install dependencies: `flutter pub get`
3. Make your changes
4. Generate code: `flutter pub run build_runner build`
5. Run tests: `flutter test`
6. Submit a pull request

## License

This project is open source and available under the MIT License.

## Author

MarscoXu - xu_pying@sina.com

## Issues

Please report issues at: https://github.com/MarscoXu/flutter-im-socket-models/issues
