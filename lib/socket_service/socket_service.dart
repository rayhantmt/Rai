
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:get_storage/get_storage.dart';

class SocketService {
  static final SocketService _instance = SocketService._internal();
  factory SocketService() => _instance;
  SocketService._internal();

  IO.Socket? _socket;
  bool _isConnecting = false;
  bool _isManuallyDisconnected = false;
  String? _currentUserId;

  static const String SOCKET_URL = 'wss://server.momentumactivity.com';

  bool get isConnected => _socket?.connected ?? false;

  Future<void> connect() async {
    if (_socket?.connected ?? false) {
      print('✅ Socket already connected');
      return;
    }

    if (_isConnecting) {
      print('⏳ Socket connection in progress...');
      return;
    }

    _isConnecting = true;

    try {
      final storage = GetStorage();
      final token = storage.read('token');

      if (token == null) {
        throw Exception('No auth token found');
      }

      print('🔌 Connecting to WebSocket...');

      _socket = IO.io(
        SOCKET_URL,
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .disableAutoConnect()
            .setAuth({'token': token})
            .setTimeout(10000)
            .build(),
      );

      _setupSocketListeners();
      _socket?.connect();
    } catch (error) {
      print('❌ Socket connection error: $error');
      _isConnecting = false;
    }
  }

  void _setupSocketListeners() {
    if (_socket == null) return;

    _socket!.onConnect((_) {
      print('✅ Socket connected: ${_socket?.id}');
      _isConnecting = false;

      if (_currentUserId != null) {
        joinUserRoom(_currentUserId!);
      }
    });

    _socket!.onConnectError((error) {
      print('❌ Socket connect error: $error');
      _isConnecting = false;
    });

    _socket!.onDisconnect((reason) {
      print('❌ Socket disconnected: $reason');
      _isConnecting = false;
    });

    _socket!.on('joined', (data) {
      print('✅ Joined user room: $data');
    });

    _socket!.on('joined_chat_room', (data) {
      print('✅ Joined chat room: ${data['chatRoomId']}');
    });
  }

  void joinUserRoom(String userId, {bool isAdmin = false}) {
    if (!(_socket?.connected ?? false)) {
      print('⚠️ Socket not connected');
      return;
    }

    _currentUserId = userId;
    _socket?.emit('join', [userId, isAdmin]);
    print('📨 Joining user room: $userId');
  }

  void joinChatRoom(String chatRoomId) {
    if (!(_socket?.connected ?? false)) {
      print('⚠️ Socket not connected');
      return;
    }

    _socket?.emit('join_chat_room', {'chatRoomId': chatRoomId});
    print('📨 Joining chat room: $chatRoomId');
  }

  void leaveChatRoom(String chatRoomId) {
    if (!(_socket?.connected ?? false)) return;

    _socket?.emit('leave_chat_room', {'chatRoomId': chatRoomId});
    print('📨 Leaving chat room: $chatRoomId');
  }

  // ADD THESE THREE METHODS
  void sendTyping(String chatRoomId, bool isTyping) {
    if (!(_socket?.connected ?? false)) return;

    _socket?.emit('typing', {'chatRoomId': chatRoomId, 'isTyping': isTyping});
  }

  void markMessageAsRead(String messageId, String chatRoomId) {
    if (!(_socket?.connected ?? false)) return;

    _socket?.emit('mark_read', {
      'messageId': messageId,
      'chatRoomId': chatRoomId,
    });
  }

  void updateStatus(String status) {
    if (!(_socket?.connected ?? false)) return;

    _socket?.emit('update_status', {'status': status});
  }
  // END OF NEW METHODS

  void on(String event, Function callback) {
    if (_socket == null) return;
    _socket!.on(event, (data) => callback(data));
    print('👂 Listening to: $event');
  }

  void off(String event) {
    if (_socket == null) return;
    _socket!.off(event);
    print('🔇 Removed listener: $event');
  }

  void disconnect() {
    _isManuallyDisconnected = true;
    _socket?.disconnect();
    _socket = null;
    print('❌ Socket disconnected');
  }
}

final socketService = SocketService();
