# Flutter IM Socket Models

IM 聊天 WebSocket 数据模型库，提供完整的消息类型支持和自动解析功能。

## 功能特点

- ✅ 支持 37 种 WebSocket 消息类型
- ✅ 自动消息解析和类型转换
- ✅ 类型安全的 Dart 模型
- ✅ 模块化、可扩展的架构
- ✅ 完整的 JSON 序列化/反序列化支持

## 支持的消息类型

### 认证相关
- `loginQrCode` - 登录二维码返回
- `waitingAuthorize` - 用户扫描成功等待授权
- `loginSuccess` - 用户登录成功返回用户信息
- `tokenExpired` - token 失效
- `invalidUser` - 拉黑用户

### 消息相关
- `receiveMessage` - 新消息
- `msgMarkItem` - 消息标记
- `msgRecall` - 消息撤回

### 在线状态
- `online` - 上线通知
- `offline` - 下线通知
- `userStateChange` - 用户状态改变
- `noInternet` - 无网络连接

### 群组相关
- `roomInfoChange` - 管理员修改群聊信息
- `myRoomInfoChange` - 自己修改我在群里的信息
- `roomDissolution` - 群解散
- `roomGroupMsg` - 用户申请加群通知消息
- `GroupApplyNotice` - 管理员用户申请加群通知消息
- `roomGroupNoticeReadMsg` - 群公告已读
- `roomNotification` - 会话消息接收类型改变
- `memberChange` - 成员变动

### 好友相关
- `requestApprovalFriend` - 同步好友请求
- `newApply` - 好友申请、群聊邀请
- `shield` - 屏蔽好友消息
- `unblock` - 解除屏蔽好友消息

### 视频通话
- `JoinVideo` - 加入视频会议
- `VideoCallRequest` - 发起通话请求
- `StartSignaling` - 开始呼叫
- `CallAccepted` - 通话已接通
- `CallRejected` - 呼叫被拒绝
- `RoomClosed` - 会议已关闭
- `MediaControl` - 媒体组件改变
- `TIMEOUT` - 通话超时
- `CANCEL` - 取消通话
- `DROPPED` - 挂断通话

### 其他
- `notice` - 通知总线
- `feedSendMsg` - 朋友圈发布
- `WSReconnect` - ws 消息重连

## 使用方法

### 基本使用

```dart
import 'package:flutter_im_socket_models/flutter_im_socket_models.dart';

// 使用顶层工厂方法解析 WebSocket 消息
final jsonData = {
  'type': 'receiveMessage',
  'data': {
    'messageId': '123',
    'roomId': 'room1',
    'senderId': 'user1',
    'content': 'Hello World',
    'messageType': 'text',
    'timestamp': 1234567890,
  }
};

final message = WebSocketMessage.fromJson(jsonData);
print('Type: ${message.type}');
print('Data: ${message.data}');

// data 会被自动解析为 ReceiveMessageData 类型
if (message.data is ReceiveMessageData) {
  final receiveMsg = message.data as ReceiveMessageData;
  print('Message: ${receiveMsg.content}');
  print('Sender: ${receiveMsg.senderId}');
}
```

### 使用 SocketService

```dart
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:flutter_im_socket_models/flutter_im_socket_models.dart';

// 初始化消息工厂
MessageFactory.registerDefaults();

// 创建 WebSocket 连接
final channel = WebSocketChannel.connect(
  Uri.parse('wss://your-server.com/ws'),
);

// 创建 SocketService
final socketService = SocketService(channel);

// 注册消息处理器
socketService.on('receiveMessage', (type, model) {
  if (model is ReceiveMessageData) {
    print('New message: ${model.content}');
  }
});

socketService.on('loginSuccess', (type, model) {
  if (model is LoginSuccessData) {
    print('Login success: ${model.username}');
  }
});

// 发送消息
socketService.sendJson({
  'type': 'sendMessage',
  'data': {
    'roomId': 'room1',
    'content': 'Hello'
  }
});

// 清理
socketService.dispose();
```

### 自定义消息类型

```dart
// 1. 创建自定义模型类
class CustomMessageData {
  final String customField;
  
  CustomMessageData({required this.customField});
  
  factory CustomMessageData.fromJson(dynamic json) {
    return CustomMessageData(
      customField: json['customField'] as String,
    );
  }
  
  Map<String, dynamic> toJson() {
    return {'customField': customField};
  }
}

// 2. 注册自定义消息类型
MessageFactory.register('customType', (j) => CustomMessageData.fromJson(j));

// 3. 使用
final message = WebSocketMessage.fromJson({
  'type': 'customType',
  'data': {'customField': 'value'}
});
```

## 架构设计

```
flutter_im_socket_models/
├── lib/
│   ├── flutter_im_socket_models.dart    # 主入口
│   └── src/
│       ├── socket_envelope.dart          # WebSocket 消息信封
│       ├── websocket_message.dart        # 顶层工厂类
│       ├── message_factory.dart          # 消息工厂
│       ├── socket_service.dart           # WebSocket 服务封装
│       └── models/                       # 数据模型
│           ├── empty_data.dart
│           ├── receive_message.dart
│           ├── login_qr_code.dart
│           └── ...
```

## 设计理念

1. **类型安全**: 每种消息类型都有对应的 Dart 模型类
2. **自动解析**: 通过消息工厂自动识别和转换消息类型
3. **模块化**: 清晰的文件结构，便于维护和扩展
4. **容错性**: 解析失败时返回原始数据，不会导致崩溃
5. **可扩展**: 支持注册自定义消息类型

## License

MIT
