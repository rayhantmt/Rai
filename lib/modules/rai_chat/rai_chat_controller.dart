
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:permission_handler/permission_handler.dart';
import 'package:rai/api_services/doi_services.dart';
import 'package:rai/exceptions/app_exceptions.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as ws_status;

class ChatMessage {
  final int id;
  final String text;
  final bool isAi;
  final String status;
  final String createdAt;
  final String? imageUrl;

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
  final DioClient _client = DioClient();
  RxDouble secheight = 7.0.obs;

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
  final selectedImagePath = ''.obs; // local path for preview in UI

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
  String? _pendingImageId; // upload result, waiting for user to tap send

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
    _initRecorder();
    _connect();
  }

  Future<void> _initRecorder() async {
    await _recorder.openRecorder();
    _recorderInitialized = true;
  }

  @override
  void onClose() {
    _sub?.cancel();
    _channel?.sink.close(ws_status.normalClosure);
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

        // FIX: Replace the optimistic local bubble (id == -1) with the real
        // server message when the server echoes back the user message.
        final optimisticIdx = messages.indexWhere((m) => m.id == -1);
        if (!msg.isAi && optimisticIdx != -1) {
          messages[optimisticIdx] = msg;
        } else {
          final idx = messages.indexWhere((m) => m.id == msg.id);
          if (idx != -1) {
            messages[idx] = msg;
          } else {
            messages.add(msg);
          }
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

  // ── Send text / image ────────────────────────────────────
  void sendMessage(String text) {
    final trimmed = text.trim();
    // allow send if there's text OR a pending image
    if ((trimmed.isEmpty && _pendingImageId == null) || isSending.value) return;
    if (_channel == null) {
      Get.snackbar('Not connected', 'Please wait…');
      return;
    }

    isSending.value = true;

    if (_pendingImageId != null) {
      // ── FIX: Add an optimistic local bubble so the image appears immediately
      // on screen without waiting for the server echo.
      messages.add(ChatMessage(
        id: -1, // temporary id; replaced when server echoes back
        text: trimmed,
        isAi: false,
        status: 'completed',
        createdAt: DateTime.now().toIso8601String(),
        imageUrl: selectedImagePath.value.isNotEmpty
            ? selectedImagePath.value // local file path shown via Image.file
            : null,
      ));

      _channel!.sink.add(jsonEncode({
        'message': trimmed,
        'image_id': _pendingImageId,
      }));

      _pendingImageId = null;
      selectedImagePath.value = ''; // clear preview
    } else {
      _channel!.sink.add(jsonEncode({'message': trimmed}));
    }
  }

  /// Call this to discard the pending image without sending.
  void removePendingImage() {
    _pendingImageId = null;
    selectedImagePath.value = '';
  }

  // ── Image: pick → upload → wait for send ────────────────
  Future<void> pickAndSendImage() async {
    try {
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
        selectedImagePath.value = '';
        isUploadingImage.value = false;
        return;
      }

      _pendingImageId = imageId; // hold until user taps send
      isUploadingImage.value = false;
    } catch (e) {
      isUploadingImage.value = false;
      selectedImagePath.value = '';
      Get.snackbar('Error', 'Could not pick image');
    }
  }

  Future<String?> _uploadImage(File file) async {
    final token = _storage.read('token') ?? '';
    isUploadingImage.value = true;

    try {
      final formData = FormData.fromMap({
        'conversation_id': conversationId,
        'image': await MultipartFile.fromFile(
          file.path,
          filename: path.basename(file.path),
        ),
      });

      print('🚀 --- SENDING IMAGE UPLOAD REQUEST ---');
      print('URL: $_baseApiUrl/api/ai/upload-image/');
      print('FIELDS: conversation_id: ${conversationId}');
      print('FILES: ${path.basename(file.path)}');

      final response = await _client.postFormData(
        url: '$_baseApiUrl/api/ai/upload-image/',
        data: formData,
        headers: {'Authorization': 'Bearer $token'},
      );

      print('✅ --- UPLOAD RESPONSE RECEIVED ---');
      print('Status Code: ${response.statusCode}');
      print('Data: ${response.data}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        return data['id']?.toString() ?? data['image_id']?.toString();
      }
      return null;
    } on BadRequestException catch (e) {
      Get.snackbar('Upload Failed', e.toString());
      print('❌ API Error: $e');
      return null;
    } on DioException catch (e) {
      Get.snackbar('Error', 'Network error: ${e.message}');
      print('❌ Dio Error: ${e.response?.data ?? e.message}');
      return null;
    } catch (e) {
      print('❌ Unexpected Error: $e');
      Get.snackbar('Error', 'Something went wrong: $e');
      return null;
    } finally {
      isUploadingImage.value = false;
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
    await Permission.microphone.request();
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
          filename: 'audio.aac',
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
        final List data = body['data'];
        conversations.value =
            data.map((e) => ConversationModel.fromJson(e)).toList();
      }
    } catch (e) {
      print('fetchConversations error: $e');
      Get.snackbar('Error', 'Could not load history');
    } finally {
      isLoadingHistory.value = false;
    }
  }

  Future<void> loadConversation(String convId) async {
    try {
      final res = await http.get(
        Uri.parse('$_baseApiUrl/api/ai/conversations/$convId/messages/'),
        headers: {'Authorization': 'Bearer $_token'},
      );
      if (res.statusCode == 200) {
        final List data = jsonDecode(res.body);
        messages.value = data.map((m) => ChatMessage.fromJson(m)).toList();
      }
    } catch (_) {}

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
    _pendingImageId = null;
    selectedImagePath.value = '';
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