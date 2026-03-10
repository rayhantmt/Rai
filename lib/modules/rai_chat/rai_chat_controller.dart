// import 'dart:async';
// import 'dart:convert';
// import 'package:get/get.dart';
// import 'package:web_socket_channel/web_socket_channel.dart';
// import 'package:web_socket_channel/status.dart' as ws_status;
// import 'package:get_storage/get_storage.dart';

// class ChatMessage {
//   final int id;
//   final String text;
//   final bool isAi;
//   final String status; // 'processing' | 'completed' | 'failed'
//   final String createdAt;

//   ChatMessage({
//     required this.id,
//     required this.text,
//     required this.isAi,
//     required this.status,
//     required this.createdAt,
//   });

//   factory ChatMessage.fromJson(Map<String, dynamic> json) => ChatMessage(
//         id: json['id'],
//         text: json['text'] ?? '',
//         isAi: json['is_ai'] ?? false,
//         status: json['status'] ?? 'completed',
//         createdAt: json['created_at'] ?? '',
//       );

//   ChatMessage copyWith({String? text, String? status}) => ChatMessage(
//         id: id,
//         text: text ?? this.text,
//         isAi: isAi,
//         status: status ?? this.status,
//         createdAt: createdAt,
//       );
// }

// class RaiChatController extends GetxController {
//   // ── Observables ────────────────────────────────────────────
//   final messages      = <ChatMessage>[].obs;
//   final isConnecting  = true.obs;
//   final isAiTyping    = false.obs;
//   final isSending     = false.obs;
//   final chatTitle     = ''.obs;
//   final errorMessage  = ''.obs;
//   final conversationId = ''.obs;

//   // ── Internals ──────────────────────────────────────────────
//   WebSocketChannel? _channel;
//   StreamSubscription? _sub;
//   final _storage = GetStorage();

//   static const String _baseWsUrl = 'wss://quicker-epistylar-barbie.ngrok-free.dev'; // 🔴 change this

//   // ── Lifecycle ──────────────────────────────────────────────
//   @override
//   void onInit() {
//     super.onInit();
//     // Pass existing conversation_id via Get.arguments, or null for new chat
//     final existingId = Get.arguments?['conversation_id'] as String?;
//     if (existingId != null) conversationId.value = existingId;
//     _connect();
//   }

//   @override
//   void onClose() {
//     _sub?.cancel();
//     _channel?.sink.close(ws_status.normalClosure);
//     super.onClose();
//   }

//   // ── Connect ────────────────────────────────────────────────
//   Future<void> _connect() async {
//     isConnecting.value = true;
//     errorMessage.value = '';

//     try {
//       final token  = _storage.read('token');
//       final path   = conversationId.value.isEmpty
//           ? '/ws/chat/new/'
//           : '/ws/chat/${conversationId.value}/';
//       final uri    = Uri.parse('$_baseWsUrl$path?token=$token');

//       _channel = WebSocketChannel.connect(uri);
//       await _channel!.ready;

//       _sub = _channel!.stream.listen(
//         _onMessage,
//         onError: (_) => errorMessage.value = 'Connection error. Retrying...',
//         onDone:  () => isConnecting.value = false,
//         cancelOnError: false,
//       );

//       isConnecting.value = false;
//     } catch (e) {
//       errorMessage.value = 'Could not connect. Please retry.';
//       isConnecting.value = false;
//     }
//   }

//   // ── Incoming messages ──────────────────────────────────────
//   void _onMessage(dynamic raw) {
//     final data = jsonDecode(raw as String) as Map<String, dynamic>;
//     switch (data['type']) {

//       case 'chat_history':
//         if (data['conversation_id'] != null) {
//           conversationId.value = data['conversation_id'];
//         }
//         final list = (data['messages'] as List? ?? [])
//             .map((m) => ChatMessage.fromJson(m))
//             .toList();
//         messages.assignAll(list);
//         break;

//       case 'new_message':
//         // Capture conversation_id for brand-new chats
//         if (data['conversation_id'] != null &&
//             conversationId.value.isEmpty) {
//           conversationId.value = data['conversation_id'];
//         }
//         final msg = ChatMessage.fromJson(data['message']);
//         final idx = messages.indexWhere((m) => m.id == msg.id);
//         if (idx != -1) {
//           messages[idx] = msg;
//         } else {
//           messages.add(msg);
//         }
//         if (!msg.isAi) isAiTyping.value = true;
//         break;

//       case 'message_update':
//         final updated = ChatMessage.fromJson(data['message']);
//         final i = messages.indexWhere((m) => m.id == updated.id);
//         if (i != -1) {
//           messages[i] = updated;
//         } else {
//           messages.add(updated);
//         }
//         if (updated.isAi &&
//             (updated.status == 'completed' || updated.status == 'failed')) {
//           isAiTyping.value = false;
//           isSending.value  = false;
//         }
//         break;

//       case 'title_updated':
//         chatTitle.value = data['title'] ?? '';
//         break;

//       case 'error':
//         isSending.value  = false;
//         isAiTyping.value = false;
//         if (data['code'] == 'ai_busy') {
//           Get.snackbar('Please wait', data['message'] ?? 'AI is busy',
//               duration: const Duration(seconds: 2));
//         } else {
//           errorMessage.value = data['message'] ?? 'Something went wrong';
//         }
//         break;
//     }
//   }

//   // ── Send ───────────────────────────────────────────────────
//   void sendMessage(String text) {
//     final trimmed = text.trim();
//     if (trimmed.isEmpty || isSending.value) return;
//     if (_channel == null) {
//       Get.snackbar('Not connected', 'Please wait…');
//       return;
//     }
//     isSending.value = true;
//     _channel!.sink.add(jsonEncode({'message': trimmed}));
//   }

//   // ── Helpers for UI ─────────────────────────────────────────
//   void startNewChat() {
//     _sub?.cancel();
//     _channel?.sink.close(ws_status.normalClosure);
//     messages.clear();
//     conversationId.value = '';
//     chatTitle.value = '';
//     _connect();
//   }

//   void clearConversation() {
//     messages.clear();
//   }
// }
// rai_chat_controller.dart

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:permission_handler/permission_handler.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as ws_status;

class ChatMessage {
  final int id;
  final String text;
  final bool isAi;
  final String status;
  final String createdAt;
  final String? imageUrl; // for showing uploaded image in bubble

  ChatMessage({
    required this.id,
    required this.text,
    required this.isAi,
    required this.status,
    required this.createdAt,
    this.imageUrl,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) => ChatMessage(
    id: json['id'],
    text: json['text'] ?? '',
    isAi: json['is_ai'] ?? false,
    status: json['status'] ?? 'completed',
    createdAt: json['created_at'] ?? '',
    imageUrl: json['image_url'],
  );

  ChatMessage copyWith({String? text, String? status}) => ChatMessage(
    id: id,
    text: text ?? this.text,
    isAi: isAi,
    status: status ?? this.status,
    createdAt: createdAt,
    imageUrl: imageUrl,
  );
}

class ConversationModel {
  final String id;
  final String title;
  final String updatedAt;

  ConversationModel({
    required this.id,
    required this.title,
    required this.updatedAt,
  });

  factory ConversationModel.fromJson(Map<String, dynamic> json) =>
      ConversationModel(
        id: json['id'].toString(),
        title: json['title'] ?? 'Untitled',
        updatedAt: json['updated_at'] ?? '',
      );
}

class RaiChatController extends GetxController {
  RxDouble secheight=7.0.obs;
  // ── Observables ──────────────────────────────────────────
  final messages = <ChatMessage>[].obs;
  final isConnecting = true.obs;
  final isAiTyping = false.obs;
  final isSending = false.obs;
  final chatTitle = ''.obs;
  final errorMessage = ''.obs;
  final conversationId = ''.obs;

  // Audio
  final isRecording = false.obs;
  final isTranscribing = false.obs;

  // Image
  final isUploadingImage = false.obs;
  final selectedImagePath = ''.obs; // local path preview

  // History
  final conversations = <ConversationModel>[].obs;
  final isLoadingHistory = false.obs;

  // ── Internals ────────────────────────────────────────────
  WebSocketChannel? _channel;
  StreamSubscription? _sub;
  final _storage = GetStorage();
  final _recorder = FlutterSoundRecorder();
  bool _recorderInitialized = false;
  final _picker = ImagePicker();
  String? _recordingPath;

  static const String _baseWsUrl =
      'wss://quicker-epistylar-barbie.ngrok-free.dev';
  static const String _baseApiUrl =
      'https://quicker-epistylar-barbie.ngrok-free.dev';

  String get _token => _storage.read('token') ?? '';

  // ── Lifecycle ────────────────────────────────────────────
  @override
  void onInit() {
    super.onInit();
    final existingId = Get.arguments?['conversation_id'] as String?;
    if (existingId != null) conversationId.value = existingId;
    _initRecorder(); // ADD THIS
    _connect();
  }

  // ADD this new method:
  Future<void> _initRecorder() async {
    await _recorder.openRecorder();
    _recorderInitialized = true;
  }

  @override
  void onClose() {
    _sub?.cancel();
    _channel?.sink.close(ws_status.normalClosure);
    // REMOVE: _recorder.dispose();
    // ADD:
    if (_recorderInitialized) _recorder.closeRecorder();
    super.onClose();
  }

  // ── WebSocket ────────────────────────────────────────────
  Future<void> _connect() async {
    isConnecting.value = true;
    errorMessage.value = '';
    try {
      final wsPath = conversationId.value.isEmpty
          ? '/ws/chat/new/'
          : '/ws/chat/${conversationId.value}/';
      final uri = Uri.parse('$_baseWsUrl$wsPath?token=$_token');

      _channel = WebSocketChannel.connect(uri);
      await _channel!.ready;

      _sub = _channel!.stream.listen(
        _onMessage,
        onError: (_) => errorMessage.value = 'Connection error.',
        onDone: () => isConnecting.value = false,
        cancelOnError: false,
      );
      isConnecting.value = false;
    } catch (e) {
      errorMessage.value = 'Could not connect. Please retry.';
      isConnecting.value = false;
    }
  }

  void _onMessage(dynamic raw) {
    final data = jsonDecode(raw as String) as Map<String, dynamic>;
    switch (data['type']) {
      case 'chat_history':
        if (data['conversation_id'] != null) {
          conversationId.value = data['conversation_id'];
        }
        final list = (data['messages'] as List? ?? [])
            .map((m) => ChatMessage.fromJson(m))
            .toList();
        messages.assignAll(list);
        break;

      case 'new_message':
        if (data['conversation_id'] != null && conversationId.value.isEmpty) {
          conversationId.value = data['conversation_id'];
        }
        final msg = ChatMessage.fromJson(data['message']);
        final idx = messages.indexWhere((m) => m.id == msg.id);
        if (idx != -1) {
          messages[idx] = msg;
        } else {
          messages.add(msg);
        }
        if (!msg.isAi) isAiTyping.value = true;
        break;

      case 'message_update':
        final updated = ChatMessage.fromJson(data['message']);
        final i = messages.indexWhere((m) => m.id == updated.id);
        if (i != -1) {
          messages[i] = updated;
        } else {
          messages.add(updated);
        }
        if (updated.isAi &&
            (updated.status == 'completed' || updated.status == 'failed')) {
          isAiTyping.value = false;
          isSending.value = false;
        }
        break;

      case 'title_updated':
        chatTitle.value = data['title'] ?? '';
        break;

      case 'error':
        isSending.value = false;
        isAiTyping.value = false;
        if (data['code'] == 'ai_busy') {
          Get.snackbar(
            'Please wait',
            data['message'] ?? 'AI is busy',
            duration: const Duration(seconds: 2),
          );
        } else {
          errorMessage.value = data['message'] ?? 'Something went wrong';
        }
        break;
    }
  }

  // ── Send text ────────────────────────────────────────────
  void sendMessage(String text) {
    final trimmed = text.trim();
    if (trimmed.isEmpty || isSending.value) return;
    if (_channel == null) {
      Get.snackbar('Not connected', 'Please wait…');
      return;
    }
    isSending.value = true;
    _channel!.sink.add(jsonEncode({'message': trimmed}));
  }

  // ── Image: pick → upload → send via WS ──────────────────
  Future<void> pickAndSendImage() async {
    try {
      // iOS 14+ needs limited/full check differently
      // Just go straight to picker — it handles permission internally
      final picked = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
      );
      if (picked == null) return;

      selectedImagePath.value = picked.path;
      isUploadingImage.value = true;

      final imageId = await _uploadImage(File(picked.path));
      if (imageId == null) {
        Get.snackbar('Upload failed', 'Could not upload image');
        isUploadingImage.value = false;
        selectedImagePath.value = '';
        return;
      }

      isUploadingImage.value = false;
      isSending.value = true;
      _channel!.sink.add(jsonEncode({'message': '', 'image_id': imageId}));
      selectedImagePath.value = '';
    } catch (e) {
      isUploadingImage.value = false;
      Get.snackbar('Error', 'Could not send image');
    }
  }

  Future<String?> _uploadImage(File file) async {
    try {
      final request = http.MultipartRequest(
        'POST',
        Uri.parse('$_baseApiUrl/api/ai/upload-image/'),
      );
      request.headers['Authorization'] = 'Bearer $_token';
      request.files.add(
        await http.MultipartFile.fromPath(
          'image', // 🔴 field name — confirm with your backend
          file.path,
          filename: path.basename(file.path),
        ),
      );

      final streamed = await request.send();
      final res = await http.Response.fromStream(streamed);
      print(res.body);

      if (res.statusCode == 200 || res.statusCode == 201) {
        final body = jsonDecode(res.body);
        return body['id']?.toString() ?? body['image_id']?.toString();
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  // ── Audio: record → stop → transcribe → send ────────────
  Future<void> toggleRecording() async {
    if (isRecording.value) {
      await _stopAndTranscribe();
    } else {
      await _startRecording();
    }
  }

  Future<void> _startRecording() async {
    final micStatus = await Permission.microphone.request();

    // iOS returns .limited sometimes — treat it as granted
    // if (!micStatus.isGranted && !micStatus.isLimited) {
    //   if (micStatus.isPermanentlyDenied) {
    //     openAppSettings();
    //     // User denied permanently — send them to settings
    //     print('Permission Denied permanently');

    //   } else {
    //     Get.snackbar('Permission denied', 'Please allow microphone access');
    //   }
    //   return;
    // }

    if (!_recorderInitialized) {
      Get.snackbar('Error', 'Recorder not ready');
      return;
    }

    final tempDir = Directory.systemTemp;
    _recordingPath =
        '${tempDir.path}/rai_audio_${DateTime.now().millisecondsSinceEpoch}.aac';

    await _recorder.startRecorder(toFile: _recordingPath, codec: Codec.aacMP4);

    isRecording.value = true;
  }

  Future<void> _stopAndTranscribe() async {
    // REMOVE: final filePath = await _recorder.stop();
    // ADD:
    final filePath = await _recorder.stopRecorder();
    isRecording.value = false;

    if (filePath == null) return;

    isTranscribing.value = true;

    try {
      final request = http.MultipartRequest(
        'POST',
        Uri.parse('$_baseApiUrl/api/ai/transcribe/'),
      );
      request.headers['Authorization'] = 'Bearer $_token';
      request.files.add(
        await http.MultipartFile.fromPath(
          'audio',
          filePath,
          filename: 'audio.aac', // changed extension to match codec
        ),
      );

      final streamed = await request.send();
      final res = await http.Response.fromStream(streamed);
      print(res.body);
      if (res.statusCode == 200 || res.statusCode == 201) {
        final body = jsonDecode(res.body);
        final transcript = body['text'] ?? body['transcript'] ?? '';
        if (transcript.isNotEmpty) {
          sendMessage(transcript);
        } else {
          Get.snackbar('No speech detected', 'Please try again');
        }
      } else {
        Get.snackbar('Transcription failed', 'Please try again');
      }
    } catch (e) {
      Get.snackbar('Error', 'Could not transcribe audio');
    } finally {
      isTranscribing.value = false;
      try {
        File(filePath).deleteSync();
      } catch (_) {}
    }
  }

  // ── Chat History ─────────────────────────────────────────
  Future<void> fetchConversations() async {
    isLoadingHistory.value = true;
    try {
      final res = await http.get(
        Uri.parse('$_baseApiUrl/api/ai/conversations/'),
        headers: {'Authorization': 'Bearer $_token'},
      );
      if (res.statusCode == 200) {
        final body = jsonDecode(res.body);
        final List data = body['data']; // ← was jsonDecode(res.body) directly
        conversations.value = data
            .map((e) => ConversationModel.fromJson(e))
            .toList();
      }
    } catch (e) {
      print('fetchConversations error: $e'); // ← add this to see real error
      Get.snackbar('Error', 'Could not load history');
    } finally {
      isLoadingHistory.value = false;
    }
  }

  Future<void> loadConversation(String convId) async {
    // 1. Fetch previous messages via REST
    try {
      final res = await http.get(
        Uri.parse('$_baseApiUrl/api/ai/conversations/$convId/messages/'),
        headers: {'Authorization': 'Bearer $_token'},
      );
      if (res.statusCode == 200) {
        final List data = jsonDecode(res.body);
        messages.value = data.map((m) => ChatMessage.fromJson(m)).toList();
      }
    } catch (e) {
      // proceed anyway, WS will also send chat_history
    }

    // 2. Reconnect WebSocket to this conversation
    _sub?.cancel();
    await _channel?.sink.close(ws_status.normalClosure);
    conversationId.value = convId;
    chatTitle.value = '';
    _connect();
  }

  Future<void> deleteConversation(String convId) async {
    try {
      final res = await http.delete(
        Uri.parse('$_baseApiUrl/api/ai/conversations/$convId/delete/'),
        headers: {'Authorization': 'Bearer $_token'},
      );
      if (res.statusCode == 200 || res.statusCode == 204) {
        conversations.removeWhere((c) => c.id == convId);
        Get.snackbar('Deleted', 'Conversation deleted');
      }
    } catch (e) {
      Get.snackbar('Error', 'Could not delete conversation');
    }
  }

  void startNewChat() {
    _sub?.cancel();
    _channel?.sink.close(ws_status.normalClosure);
    messages.clear();
    conversationId.value = '';
    chatTitle.value = '';
    _connect();
  }

  void clearConversation() => messages.clear();

  String _formatDate(String dateStr) {
    try {
      final dt = DateTime.parse(dateStr);
      final now = DateTime.now();
      final diff = now.difference(dt);
      if (diff.inDays == 0) return 'Today';
      if (diff.inDays == 1) return 'Yesterday';
      return '${dt.day}/${dt.month}';
    } catch (_) {
      return '';
    }
  }

  String formatConvDate(String dateStr) => _formatDate(dateStr);
}
