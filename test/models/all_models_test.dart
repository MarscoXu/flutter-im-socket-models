import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_im_socket_models/src/models/online_offline.dart';
import 'package:flutter_im_socket_models/src/models/room_info_change.dart';
import 'package:flutter_im_socket_models/src/models/my_room_info_change.dart';
import 'package:flutter_im_socket_models/src/models/token_expired.dart';
import 'package:flutter_im_socket_models/src/models/invalid_user.dart';
import 'package:flutter_im_socket_models/src/models/msg_mark_item.dart';
import 'package:flutter_im_socket_models/src/models/msg_recall.dart';
import 'package:flutter_im_socket_models/src/models/request_approval_friend.dart';
import 'package:flutter_im_socket_models/src/models/new_apply.dart';
import 'package:flutter_im_socket_models/src/models/room_dissolution.dart';
import 'package:flutter_im_socket_models/src/models/member_change.dart';

void main() {
  group('OnlineOfflineData', () {
    test('should serialize and deserialize correctly', () {
      final data = OnlineOfflineData(
        userId: 'user123',
        status: 'online',
        timestamp: 1234567890,
        deviceId: 'device456',
      );

      final json = data.toJson();
      final restored = OnlineOfflineData.fromJson(json);

      expect(restored.userId, data.userId);
      expect(restored.status, data.status);
      expect(restored.timestamp, data.timestamp);
    });
  });

  group('RoomInfoChangeData', () {
    test('should serialize and deserialize correctly', () {
      final data = RoomInfoChangeData(
        roomId: 'room123',
        roomName: 'Test Room',
        changeType: 'name_changed',
        timestamp: 1234567890,
      );

      final json = data.toJson();
      final restored = RoomInfoChangeData.fromJson(json);

      expect(restored.roomId, data.roomId);
      expect(restored.roomName, data.roomName);
      expect(restored.changeType, data.changeType);
    });
  });

  group('MyRoomInfoChangeData', () {
    test('should serialize and deserialize correctly', () {
      final data = MyRoomInfoChangeData(
        roomId: 'room123',
        myRole: 'admin',
        myNickname: 'TestUser',
        isMuted: false,
        timestamp: 1234567890,
      );

      final json = data.toJson();
      final restored = MyRoomInfoChangeData.fromJson(json);

      expect(restored.roomId, data.roomId);
      expect(restored.myRole, data.myRole);
      expect(restored.isMuted, data.isMuted);
    });
  });

  group('TokenExpiredData', () {
    test('should serialize and deserialize correctly', () {
      const data = TokenExpiredData(
        message: 'Token has expired',
        userId: 'user123',
        needRelogin: true,
        expireTime: 1234567890,
      );

      final json = data.toJson();
      final restored = TokenExpiredData.fromJson(json);

      expect(restored.message, data.message);
      expect(restored.userId, data.userId);
      expect(restored.needRelogin, data.needRelogin);
    });
  });

  group('InvalidUserData', () {
    test('should serialize and deserialize correctly', () {
      const data = InvalidUserData(
        userId: 'user123',
        reason: 'User banned',
        message: 'Your account has been banned',
        timestamp: 1234567890,
      );

      final json = data.toJson();
      final restored = InvalidUserData.fromJson(json);

      expect(restored.userId, data.userId);
      expect(restored.reason, data.reason);
      expect(restored.message, data.message);
    });
  });

  group('MsgMarkItemData', () {
    test('should serialize and deserialize correctly', () {
      final data = MsgMarkItemData(
        messageId: 'msg123',
        roomId: 'room456',
        userId: 'user789',
        markType: 'like',
        timestamp: 1234567890,
      );

      final json = data.toJson();
      final restored = MsgMarkItemData.fromJson(json);

      expect(restored.messageId, data.messageId);
      expect(restored.markType, data.markType);
    });
  });

  group('MsgRecallData', () {
    test('should serialize and deserialize correctly', () {
      const data = MsgRecallData(
        messageId: 'msg123',
        roomId: 'room456',
        recallerId: 'user789',
        reason: 'Inappropriate content',
        timestamp: 1234567890,
      );

      final json = data.toJson();
      final restored = MsgRecallData.fromJson(json);

      expect(restored.messageId, data.messageId);
      expect(restored.recallerId, data.recallerId);
    });
  });

  group('RequestApprovalFriendData', () {
    test('should serialize and deserialize correctly', () {
      final data = RequestApprovalFriendData(
        requestId: 'req123',
        fromUserId: 'user456',
        toUserId: 'user789',
        message: 'Hi, let\'s be friends!',
        status: 'pending',
        timestamp: 1234567890,
      );

      final json = data.toJson();
      final restored = RequestApprovalFriendData.fromJson(json);

      expect(restored.requestId, data.requestId);
      expect(restored.status, data.status);
    });
  });

  group('NewApplyData', () {
    test('should serialize and deserialize correctly', () {
      const data = NewApplyData(
        applyId: 'apply123',
        applicantId: 'user456',
        targetId: 'user789',
        applyType: 'friend',
        status: 'pending',
        timestamp: 1234567890,
      );

      final json = data.toJson();
      final restored = NewApplyData.fromJson(json);

      expect(restored.applyId, data.applyId);
      expect(restored.applyType, data.applyType);
    });
  });

  group('RoomDissolutionData', () {
    test('should serialize and deserialize correctly', () {
      const data = RoomDissolutionData(
        roomId: 'room123',
        roomName: 'Test Room',
        operatorId: 'user456',
        reason: 'Room disbanded',
        timestamp: 1234567890,
      );

      final json = data.toJson();
      final restored = RoomDissolutionData.fromJson(json);

      expect(restored.roomId, data.roomId);
      expect(restored.roomName, data.roomName);
    });
  });

  group('MemberChangeData', () {
    test('should serialize and deserialize correctly', () {
      final data = MemberChangeData(
        roomId: 'room123',
        userId: 'user456',
        changeType: 'join',
        operatorId: 'user789',
        timestamp: 1234567890,
      );

      final json = data.toJson();
      final restored = MemberChangeData.fromJson(json);

      expect(restored.roomId, data.roomId);
      expect(restored.userId, data.userId);
      expect(restored.changeType, data.changeType);
    });
  });
}
