# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2025-10-21

### Added
- Initial release of Flutter IM Socket Models package
- 16 distinct message data models with JSON serialization:
  - `EmptyData` - For message types with no payload
  - `ReceiveMessageData` - Incoming messages
  - `LoginQrCodeData` - QR code login information
  - `NoInternetData` - Network connectivity issues
  - `LoginSuccessData` - Successful authentication
  - `OnlineOfflineData` - User presence status
  - `RoomInfoChangeData` - Room/group information updates
  - `MyRoomInfoChangeData` - User's room-specific settings
  - `TokenExpiredData` - Authentication token expiration
  - `InvalidUserData` - Invalid user errors
  - `MsgMarkItemData` - Message reactions/marks
  - `MsgRecallData` - Message deletion/recall
  - `RequestApprovalFriendData` - Friend requests
  - `NewApplyData` - New applications/requests
  - `RoomDissolutionData` - Room/group dissolution
  - `MemberChangeData` - Member join/leave events
- `SocketEnvelope` class for wrapping WebSocket messages
- `MessageFactory` with automatic type registration for 37 message types
- `SocketService` for WebSocket connection management
- Comprehensive test suite with 23+ tests
- Full API documentation in README
- Working example demonstrating all major features

### Features
- Type-safe models with `@JsonSerializable` annotations
- Automatic JSON serialization/deserialization
- Message factory pattern for dynamic type resolution
- Built-in error handling and logging
- Support for 37 different WebSocket message types
- Clean separation between required and optional fields
- Null-safe implementation

### Message Types Supported
Authentication & Connection: `loginQrCode`, `waitingAuthorize`, `loginSuccess`, `tokenExpired`, `invalidUser`, `noInternet`

Messages: `receiveMessage`, `msgMarkItem`, `msgRecall`

User Status: `online`, `offline`, `userStateChange`

Room Management: `roomInfoChange`, `myRoomInfoChange`, `roomDissolution`, `memberChange`, `roomGroupMsg`, `roomGroupNoticeReadMsg`, `roomNotification`

Friend Management: `requestApprovalFriend`, `newApply`, `GroupApplyNotice`

Other: `notice`, `feedSendMsg`, `shield`, `unblock`, `WSReconnect`

Video Calling: `JoinVideo`, `VideoCallRequest`, `StartSignaling`, `CallAccepted`, `CallRejected`, `RoomClosed`, `MediaControl`, `TIMEOUT`, `CANCEL`, `DROPPED`
