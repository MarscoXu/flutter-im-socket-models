import 'dart:collection';
import 'models/empty_data.dart';
import 'models/receive_message.dart';
import 'models/login_qr_code.dart';
import 'models/no_internet.dart';
import 'models/login_success.dart';
import 'models/online_offline.dart';
import 'models/room_info_change.dart';
import 'models/my_room_info_change.dart';
import 'models/token_expired.dart';
import 'models/invalid_user.dart';
import 'models/msg_mark_item.dart';
import 'models/msg_recall.dart';
import 'models/request_approval_friend.dart';
import 'models/new_apply.dart';
import 'models/room_dissolution.dart';
import 'models/member_change.dart';

typedef FromJsonFunc = dynamic Function(dynamic json);

class MessageFactory {
  static final Map<String, FromJsonFunc> _registry = HashMap();
  static bool _initialized = false;

  static void register(String type, FromJsonFunc parser) {
    _registry[type] = parser;
  }

  static void unregister(String type) {
    _registry.remove(type);
  }

  static dynamic decode(String type, dynamic json) {
    final parser = _registry[type];
    if (parser != null) {
      try {
        return parser(json);
      } catch (e, st) {
        print('❌ MessageFactory decode failed for "$type": $e\n$st');
        return json;
      }
    }
    print('⚠️ No parser registered for type: $type');
    return json;
  }

  static void registerDefaults() {
    if (_initialized) return;
    _initialized = true;

    register('receiveMessage', (j) => ReceiveMessageData.fromJson(j));
    register('loginQrCode', (j) => LoginQrCodeData.fromJson(j));
    register('noInternet', (j) => NoInternetData.fromJson(j));
    register('waitingAuthorize', (j) => EmptyData.fromJson(j));
    register('loginSuccess', (j) => LoginSuccessData.fromJson(j));
    register('online', (j) => OnlineOfflineData.fromJson(j));
    register('offline', (j) => OnlineOfflineData.fromJson(j));
    register('userStateChange', (j) => EmptyData.fromJson(j));
    register('roomInfoChange', (j) => RoomInfoChangeData.fromJson(j));
    register('myRoomInfoChange', (j) => MyRoomInfoChangeData.fromJson(j));
    register('tokenExpired', (j) => TokenExpiredData.fromJson(j));
    register('invalidUser', (j) => InvalidUserData.fromJson(j));
    register('msgMarkItem', (j) => MsgMarkItemData.fromJson(j));
    register('msgRecall', (j) => MsgRecallData.fromJson(j));
    register('notice', (j) => EmptyData.fromJson(j));
    register('requestApprovalFriend', (j) => RequestApprovalFriendData.fromJson(j));
    register('newApply', (j) => NewApplyData.fromJson(j));
    register('roomDissolution', (j) => RoomDissolutionData.fromJson(j));
    register('roomGroupMsg', (j) => EmptyData.fromJson(j));
    register('GroupApplyNotice', (j) => EmptyData.fromJson(j));
    register('roomGroupNoticeReadMsg', (j) => EmptyData.fromJson(j));
    register('feedSendMsg', (j) => EmptyData.fromJson(j));
    register('roomNotification', (j) => EmptyData.fromJson(j));
    register('shield', (j) => EmptyData.fromJson(j));
    register('unblock', (j) => EmptyData.fromJson(j));
    register('memberChange', (j) => MemberChangeData.fromJson(j));
    register('WSReconnect', (j) => EmptyData.fromJson(j));
    register('JoinVideo', (j) => EmptyData.fromJson(j));
    register('VideoCallRequest', (j) => EmptyData.fromJson(j));
    register('StartSignaling', (j) => EmptyData.fromJson(j));
    register('CallAccepted', (j) => EmptyData.fromJson(j));
    register('CallRejected', (j) => EmptyData.fromJson(j));
    register('RoomClosed', (j) => EmptyData.fromJson(j));
    register('MediaControl', (j) => EmptyData.fromJson(j));
    register('TIMEOUT', (j) => EmptyData.fromJson(j));
    register('CANCEL', (j) => EmptyData.fromJson(j));
    register('DROPPED', (j) => EmptyData.fromJson(j));

    print('✅ MessageFactory: 37 event types registered');
  }
}