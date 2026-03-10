// services/websocket_service.dart

import 'dart:async';
import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

class WebSocketService {
  static final WebSocketService _instance = WebSocketService._internal();
  factory WebSocketService() => _instance;
  WebSocketService._internal();

  WebSocketChannel? _channel;
  StreamController<Map<String, dynamic>>? _messageController;
  bool _isConnected = false;
  bool _isConnecting = false;
  String? _currentConversationId;
  Timer? _reconnectTimer;

  static const String BASE_WS_URL = 'wss://quicker-epistylar-barbie.ngrok-free.dev'; // or ws:// for local

  bool get isConnected => _isConnected;
  String? get currentConversationId => _currentConversationId;

  Stream<Map<String, dynamic>>? get messageStream =>
      _messageController?.stream;

  // Call this to start a NEW conversation
  Future<bool> connectNew() async {
    return await _connect('/ws/chat/new/');
  }

  // Call this to continue an EXISTING conversation
  Future<bool> connectExisting(String conversationId) async {
    _currentConversationId = conversationId;
    return await _connect('/ws/chat/$conversationId/');
  }

  Future<bool> _connect(String path) async {
    if (_isConnecting) return false;
    if (_isConnected) await disconnect();

    _isConnecting = true;
    _messageController = StreamController<Map<String, dynamic>>.broadcast();

    try {
      final storage = GetStorage();
      final token = storage.read('token');

      // Django Channels reads auth from cookies or query params
      // Add token as query param since WS can't set headers easily
      final uri = Uri.parse('$BASE_WS_URL$path?token=$token');

      _channel = WebSocketChannel.connect(uri);

      // Wait for connection to be ready
      await _channel!.ready;

      _isConnected = true;
      _isConnecting = false;

      _channel!.stream.listen(
        _onMessage,
        onError: _onError,
        onDone: _onDone,
        cancelOnError: false,
      );

      print('✅ WebSocket connected: $path');
      return true;
    } catch (e) {
      print('❌ WebSocket connect error: $e');
      _isConnecting = false;
      _isConnected = false;
      return false;
    }
  }

  void _onMessage(dynamic rawData) {
    try {
      final Map<String, dynamic> data = jsonDecode(rawData as String);
      final type = data['type'] as String?;

      print('📨 WS Message received: $type');

      // Auto-capture conversation_id from first message
      if (_currentConversationId == null && data['conversation_id'] != null) {
        _currentConversationId = data['conversation_id'];
      }

      _messageController?.add(data);
    } catch (e) {
      print('❌ WS parse error: $e');
    }
  }

  void _onError(dynamic error) {
    print('❌ WS error: $error');
    _isConnected = false;
    _messageController?.add({'type': 'connection_error', 'message': error.toString()});
    _scheduleReconnect();
  }

  void _onDone() {
    print('🔌 WS connection closed');
    _isConnected = false;
    _messageController?.add({'type': 'disconnected'});
  }

  void _scheduleReconnect() {
    _reconnectTimer?.cancel();
    if (_currentConversationId != null) {
      _reconnectTimer = Timer(const Duration(seconds: 3), () {
        print('🔄 Attempting reconnect...');
        connectExisting(_currentConversationId!);
      });
    }
  }

  // Send a text message
  void sendMessage(String text, {String? imageId}) {
    if (!_isConnected || _channel == null) {
      print('⚠️ WebSocket not connected');
      return;
    }

    final payload = <String, dynamic>{'message': text};
    if (imageId != null) payload['image_id'] = imageId;

    _channel!.sink.add(jsonEncode(payload));
    print('📤 Sent message: $text');
  }

  Future<void> disconnect() async {
    _reconnectTimer?.cancel();
    _isConnected = false;
    _isConnecting = false;
    _currentConversationId = null;

    await _channel?.sink.close(status.normalClosure);
    await _messageController?.close();
    _channel = null;
    _messageController = null;

    print('🔌 WebSocket disconnected');
  }
}

final webSocketService = WebSocketService();