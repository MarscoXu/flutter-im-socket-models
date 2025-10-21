# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.0] - 2025-10-21

### Added
- Initial release of Flutter IM Socket Models package
- Support for 37 WebSocket message types
- 16 unique model classes with JSON serialization:
  - `ReceiveMessageData` - Message reception
  - `LoginQrCodeData` - QR code login
  - `NoInternetData` - Network connection status
  - `LoginSuccessData` - Successful authentication
  - `OnlineOfflineData` - User presence status
  - `RoomInfoChangeData` - Room information updates
  - `MyRoomInfoChangeData` - Personal room settings
  - `TokenExpiredData` - Token expiration
  - `InvalidUserData` - Invalid user notification
  - `MsgMarkItemData` - Message reactions/marks
  - `MsgRecallData` - Message recall
  - `RequestApprovalFriendData` - Friend requests
  - `NewApplyData` - Application requests
  - `RoomDissolutionData` - Room dissolution
  - `MemberChangeData` - Member changes
  - `EmptyData` - Empty data for 21 message types
- `SocketEnvelope` for message wrapping
- `MessageFactory` for type-safe message parsing
- `SocketService` for WebSocket event handling
- Comprehensive unit tests
- Integration tests
- Example usage code
- Full documentation

### Features
- JSON serialization with `json_serializable`
- Type-safe message decoding
- Event-driven WebSocket interface
- Support for all IM system message types:
  - Authentication & user management
  - User status updates
  - Messaging features
  - Room management
  - Friend requests
  - Privacy controls
  - Video calling
  - Connection management

[0.1.0]: https://github.com/MarscoXu/flutter-im-socket-models/releases/tag/v0.1.0
