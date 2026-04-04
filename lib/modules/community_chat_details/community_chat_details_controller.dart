// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:rai/api_services/api_services.dart';
// import 'package:rai/exceptions/app_exceptions.dart';
// import 'package:rai/modules/community_chat_details/community_chat_details_model.dart';

// class CommunityChatDetailsController extends GetxController {
//   var id = ''.obs;
//   var name = ''.obs;
//   var img = ''.obs;
//   var member = ''.obs;

//   @override
//   void onInit() {
//     super.onInit();

//     final args = Get.arguments;

//     id.value = args['id'];
//     fetchdetails();
//   }

//   RxBool isLoading = false.obs;
//   Rxn<CommunityChatDetailsModel> communityDetails = Rxn<CommunityChatDetailsModel>();
//   Future<void> fetchdetails() async {
//     isLoading.value = true;
//     try {
//       final storage = GetStorage();
//       final token = storage.read('token');
//       final response2 = await ApiService.get(
//         endpoint: '/api/community/${id.value}/',
//         headers: {'Authorization': 'Bearer $token'},
//       );
//       print(response2);
//        communityDetails.value = CommunityChatDetailsModel.fromJson(response2['data']);
//       final data = response2['data'];
//       print(data);
//     } on AppException catch (e) {
//       print(e.message);
//       Get.snackbar("Error", e.message);
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rai/modules/community_chat_details/community_chat_details_model.dart';
import 'package:rai/modules/rai_chat/rai_chat_controller.dart' hide ChatMessage;
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:rai/api_services/api_services.dart';
import 'package:rai/exceptions/app_exceptions.dart';


// ─── WebSocket base URL ────────────────────────────────────────────────────────
// Replace with your actual WS host, e.g. ws://192.168.1.10:8000
// For production use wss://yourdomain.com
const String _wsBaseUrl =  'wss://quicker-epistylar-barbie.ngrok-free.dev';

class CommunityChatDetailsController extends GetxController {
  // ── Existing state (untouched) ──────────────────────────────────────────────
  var id = ''.obs;
  var name = ''.obs;
  var img = ''.obs;
  var member = ''.obs;

  RxBool isLoading = false.obs;
  Rxn<CommunityChatDetailsModel> communityDetails =
      Rxn<CommunityChatDetailsModel>();

  // ── Chat / WebSocket state ──────────────────────────────────────────────────
  final RxList<ChatMessage> messages = <ChatMessage>[].obs;
  final RxBool isConnected = false.obs;
  final RxBool isConnecting = false.obs;

  final TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  WebSocketChannel? _channel;
  StreamSubscription? _subscription;

  // ── Lifecycle ───────────────────────────────────────────────────────────────

  @override
  void onInit() {
    super.onInit();

    final args = Get.arguments;
    id.value = args['id'] ?? '';

    // Existing fetch — kept exactly as-is
    fetchdetails();
  }

  @override
  void onClose() {
    _disconnectSocket();
    messageController.dispose();
    scrollController.dispose();
    super.onClose();
  }

  // ── Existing API call (untouched) ──────────────────────────────────────────

  Future<void> fetchdetails() async {
    isLoading.value = true;
    try {
      final storage = GetStorage();
      final token = storage.read('token');
      final response2 = await ApiService.get(
        endpoint: '/api/community/${id.value}/',
        headers: {'Authorization': 'Bearer $token'},
      );
      print(response2);
      communityDetails.value =
          CommunityChatDetailsModel.fromJson(response2['data']);
      final data = response2['data'];
      print(data);

      // After details are loaded, connect the WebSocket
      _connectSocket();
    } on AppException catch (e) {
      print(e.message);
      Get.snackbar("Error", e.message);
    } finally {
      isLoading.value = false;
    }
  }

  // ── WebSocket ───────────────────────────────────────────────────────────────

  void _connectSocket() {
    if (id.value.isEmpty) return;
    if (isConnected.value || isConnecting.value) return;

    isConnecting.value = true;

    try {
      final storage = GetStorage();
      final token = storage.read('token');

      // Django Channels expects the token in the query string (or via cookie).
      // Adjust if your auth middleware reads it differently.
      final uri = Uri.parse(
          '$_wsBaseUrl/ws/community/${id.value}/?token=$token');

      _channel = WebSocketChannel.connect(uri);
      isConnected.value = true;
      isConnecting.value = false;

      _subscription = _channel!.stream.listen(
        _onMessage,
        onError: _onError,
        onDone: _onDone,
        cancelOnError: false,
      );

      print('[WS] Connected to community ${id.value}');
    } catch (e) {
      isConnecting.value = false;
      isConnected.value = false;
      print('[WS] Connection error: $e');
      Get.snackbar('Connection Error', 'Could not connect to chat.');
    }
  }

  void _onMessage(dynamic raw) {
    try {
      final Map<String, dynamic> data = jsonDecode(raw as String);
      final String type = data['type'] ?? '';

      if (type == 'history') {
        // Bulk load past messages
        final List<dynamic> list = data['messages'] ?? [];
        messages.assignAll(
          list.map((m) => ChatMessage.fromJson(m as Map<String, dynamic>)),
        );
        _scrollToBottom();
      } else if (type == 'chat_message') {
        // Single incoming message
        final msg = ChatMessage.fromJson(data);
        messages.add(msg);
        _scrollToBottom();
      } else if (type == 'error') {
        Get.snackbar('Chat Error', data['message'] ?? 'Unknown error');
      }
    } catch (e) {
      print('[WS] Parse error: $e');
    }
  }

  void _onError(Object error) {
    print('[WS] Error: $error');
    isConnected.value = false;
    Get.snackbar('Connection Lost', 'Reconnecting...',
        duration: const Duration(seconds: 2));
    // Simple exponential back-off retry
    Future.delayed(const Duration(seconds: 3), _connectSocket);
  }

  void _onDone() {
    print('[WS] Connection closed');
    isConnected.value = false;
  }

  void _disconnectSocket() {
    _subscription?.cancel();
    _channel?.sink.close();
    _channel = null;
    isConnected.value = false;
  }

  void sendMessage() {
    final text = messageController.text.trim();
    if (text.isEmpty) return;
    if (!isConnected.value) {
      Get.snackbar('Not Connected', 'Reconnecting, please wait...');
      _connectSocket();
      return;
    }

    final payload = jsonEncode({'message': text});
    _channel?.sink.add(payload);
    messageController.clear();
  }

  // ── Helpers ─────────────────────────────────────────────────────────────────

  void _scrollToBottom() {
    // Give the list time to render the new item before scrolling
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  /// Returns true if this message was sent by the logged-in user.
  bool isMyMessage(ChatMessage msg) {
    final storage = GetStorage();
    final myId = storage.read('user_id'); // adjust key to match your storage
    return msg.sender.id.toString() == myId?.toString();
  }
}