// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart' as http hide Response;
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:http/http.dart';
// import 'package:http/http.dart' as http hide MultipartFile;
// import 'package:image_picker/image_picker.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:rai/api_services/api_config.dart';
// import 'package:rai/modules/community_chat_details/community_chat_details_model.dart';
// import 'package:rai/modules/rai_chat/rai_chat_controller.dart' hide ChatMessage;
// import 'package:web_socket_channel/web_socket_channel.dart';
// import 'package:rai/api_services/api_services.dart';
// import 'package:rai/exceptions/app_exceptions.dart';

// const String _wsBaseUrl =  'wss://quicker-epistylar-barbie.ngrok-free.dev';

// class CommunityChatDetailsController extends GetxController {

//   var id = ''.obs;
//   var name = ''.obs;
//   var img = ''.obs;
//   var member = ''.obs;

//   RxBool isLoading = false.obs;
//   Rxn<CommunityChatDetailsModel> communityDetails =
//       Rxn<CommunityChatDetailsModel>();

//   // ── Chat / WebSocket state
//   final RxList<ChatMessage> messages = <ChatMessage>[].obs;
//   final RxBool isConnected = false.obs;
//   final RxBool isConnecting = false.obs;

//   final TextEditingController messageController = TextEditingController();
//   final ScrollController scrollController = ScrollController();

//   WebSocketChannel? _channel;
//   StreamSubscription? _subscription;

//   // ── Lifecycle ───────────────────────────────────────────────────────────────

//   @override
//   void onInit() {
//     super.onInit();

//     final args = Get.arguments;
//     id.value = args['id'] ?? '';

//     // Existing fetch — kept exactly as-is
//     fetchdetails();
//   }

//   @override
//   void onClose() {
//     _disconnectSocket();
//     messageController.dispose();
//     scrollController.dispose();
//     super.onClose();
//   }

//   // ── Existing API call (untouched) ──────────────────────────────────────────

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
//       communityDetails.value =
//           CommunityChatDetailsModel.fromJson(response2['data']);
//       final data = response2['data'];
//       print(data);

//       // After details are loaded, connect the WebSocket
//       _connectSocket();
//     } on AppException catch (e) {
//       print(e.message);
//       Get.snackbar("Error", e.message);
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   //  WebSocket

//   void _connectSocket() {
//     if (id.value.isEmpty) return;
//     if (isConnected.value || isConnecting.value) return;

//     isConnecting.value = true;

//     try {
//       final storage = GetStorage();
//       final token = storage.read('token');

//       // Django Channels expects the token in the query string (or via cookie).
//       // Adjust if your auth middleware reads it differently.
//       final uri = Uri.parse(
//           '$_wsBaseUrl/ws/community/${id.value}/?token=$token');

//       _channel = WebSocketChannel.connect(uri);
//       isConnected.value = true;
//       isConnecting.value = false;

//       _subscription = _channel!.stream.listen(
//         _onMessage,
//         onError: _onError,
//         onDone: _onDone,
//         cancelOnError: false,
//       );

//       print('[WS] Connected to community ${id.value}');
//     } catch (e) {
//       isConnecting.value = false;
//       isConnected.value = false;
//       print('[WS] Connection error: $e');
//       Get.snackbar('Connection Error', 'Could not connect to chat.');
//     }
//   }

//   void _onMessage(dynamic raw) {
//     try {
//       final Map<String, dynamic> data = jsonDecode(raw as String);
//       final String type = data['type'] ?? '';

//       if (type == 'history') {
//         // Bulk load past messages
//         final List<dynamic> list = data['messages'] ?? [];
//         messages.assignAll(
//           list.map((m) => ChatMessage.fromJson(m as Map<String, dynamic>)),
//         );
//         _scrollToBottom();
//       } else if (type == 'chat_message') {
//         // Single incoming message
//         final msg = ChatMessage.fromJson(data);
//         messages.add(msg);
//         _scrollToBottom();
//       } else if (type == 'error') {
//         Get.snackbar('Chat Error', data['message'] ?? 'Unknown error');
//       }
//     } catch (e) {
//       print('[WS] Parse error: $e');
//     }
//   }

//   void _onError(Object error) {
//     print('[WS] Error: $error');
//     isConnected.value = false;
//     Get.snackbar('Connection Lost', 'Reconnecting...',
//         duration: const Duration(seconds: 2));
//     // Simple exponential back-off retry
//     Future.delayed(const Duration(seconds: 3), _connectSocket);
//   }

//   void _onDone() {
//     print('[WS] Connection closed');
//     isConnected.value = false;
//   }

//   void _disconnectSocket() {
//     _subscription?.cancel();
//     _channel?.sink.close();
//     _channel = null;
//     isConnected.value = false;
//   }

//   void sendMessage() {
//     final text = messageController.text.trim();
//     if (text.isEmpty) return;
//     if (!isConnected.value) {
//       Get.snackbar('Not Connected', 'Reconnecting, please wait...');
//       _connectSocket();
//       return;
//     }

//     final payload = jsonEncode({'message': text});
//     _channel?.sink.add(payload);
//     messageController.clear();
//   }

//   // ── Helpers ─────────────────────────────────────────────────────────────────

//   void _scrollToBottom() {
//     // Give the list time to render the new item before scrolling
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       if (scrollController.hasClients) {
//         scrollController.animateTo(
//           scrollController.position.maxScrollExtent,
//           duration: const Duration(milliseconds: 300),
//           curve: Curves.easeOut,
//         );
//       }
//     });
//   }

//   /// Returns true if this message was sent by the logged-in user.
//   bool isMyMessage(ChatMessage msg) {
//     final storage = GetStorage();
//     final myId = storage.read('user_id'); // adjust key to match your storage
//     return msg.sender.id.toString() == myId?.toString();
//   }
// ── Media Upload ─────────────────────────────────────────────────────────────

// Future<void> sendImage() async {
//   try {
//     final ImagePicker picker = ImagePicker();
//     final XFile? pickedFile =
//         await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

//     if (pickedFile == null) return; // user cancelled

//     final storage = GetStorage();
//     final token = storage.read('token');

//     final uri = Uri.parse(
//         '${ApiConfig.baseUrl}/api/community/${id.value}/upload-media/');

//     final request = http.MultipartRequest('POST', uri)
//       ..headers['Authorization'] = 'Bearer $token'
//       ..fields['type'] = 'image'
//       ..files.add(await http.MultipartFile.fromPath(
//         'file',
//         pickedFile.path,
//         contentType: MediaType('image', 'jpeg'),
//       ));

//     final streamed = await request.send();
//     final response = await http.Response.fromStream(streamed);
//     final body = jsonDecode(response.body);

//     if (response.statusCode == 200 || response.statusCode == 201) {
//       final fileUrl = body['data']['url']; // 🔁 adjust key to match your response
//       // Send the image URL through WebSocket
//       final payload = jsonEncode({
//         'message': fileUrl,
//         'message_type': 'image', // 🔁 adjust if your backend expects different
//       });
//       _channel?.sink.add(payload);
//     } else {
//       Get.snackbar('Upload Failed', body['message'] ?? 'Image upload failed');
//     }
//   } catch (e) {
//     print('[IMAGE UPLOAD] Error: $e');
//     Get.snackbar('Error', 'Could not send image');
//   }
// }

// Future<void> startRecording() async {
//   await Permission.microphone.request();
//   if (!_recorderInitialized) {
//     Get.snackbar('Error', 'Recorder not ready');
//     return;
//   }
//   final tempDir = Directory.systemTemp;
//   _recordingPath =
//       '${tempDir.path}/rai_audio_${DateTime.now().millisecondsSinceEpoch}.aac';

//   await _recorder.startRecorder(toFile: _recordingPath, codec: Codec.aacMP4);
//   isRecording.value = true;
// }

// Future<void> stopAndSendAudio() async {
//   final filePath = await _recorder.stopRecorder();
//   isRecording.value = false;

//   if (filePath == null) return;

//   try {
//     final storage = GetStorage();
//     final token = storage.read('token');

//     final uri = Uri.parse(
//         '${ApiConfig.baseUrl}/api/community/${id.value}/upload-media/');

//     final request = http.MultipartRequest('POST', uri)
//       ..headers['Authorization'] = 'Bearer $token'
//       ..fields['type'] = 'audio'
//       ..files.add(await http.MultipartFile.fromPath(
//         'file',
//         filePath,
//         filename: 'audio.aac',
//         contentType: MediaType('audio', 'aac'),
//       ));

//     final streamed = await request.send();
//     final response = await http.Response.fromStream(streamed);
//     final body = jsonDecode(response.body);

//     if (response.statusCode == 200 || response.statusCode == 201) {
//       final fileUrl = body['data']['url']; // 🔁 adjust to match your response key
//       final payload = jsonEncode({
//         'message': fileUrl,
//         'message_type': 'audio', // 🔁 adjust if backend expects different
//       });
//       _channel?.sink.add(payload);
//     } else {
//       Get.snackbar('Upload Failed', body['message'] ?? 'Audio upload failed');
//     }
//   } catch (e) {
//     print('[AUDIO SEND] Error: $e');
//     Get.snackbar('Error', 'Could not send audio');
//   } finally {
//     // Clean up the temp file after sending
//     try {
//       File(filePath).deleteSync();
//     } catch (_) {}
//   }
// }
//}
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:get/get.dart' hide MultipartFile, FormData;
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rai/api_services/api_config.dart';
import 'package:rai/api_services/api_services.dart';
import 'package:rai/api_services/doi_services.dart';
import 'package:rai/exceptions/app_exceptions.dart';
import 'package:rai/modules/community_chat_details/community_chat_details_model.dart';
import 'package:rai/modules/rai_chat/rai_chat_controller.dart' hide ChatMessage;
import 'package:web_socket_channel/web_socket_channel.dart';

const String _wsBaseUrl = 'wss://quicker-epistylar-barbie.ngrok-free.dev';

class CommunityChatDetailsController extends GetxController {
  var id = ''.obs;
  var name = ''.obs;
  var img = ''.obs;
  var member = ''.obs;

  RxBool isLoading = false.obs;
  Rxn<CommunityChatDetailsModel> communityDetails =
      Rxn<CommunityChatDetailsModel>();

  // ── Chat / WebSocket state
  final RxList<ChatMessage> messages = <ChatMessage>[].obs;
  final RxBool isConnected = false.obs;
  final RxBool isConnecting = false.obs;

  final TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  WebSocketChannel? _channel;
  StreamSubscription? _subscription;

  // ── Recorder state ───────────────────────────────────────────────────────────
  final FlutterSoundRecorder _recorder = FlutterSoundRecorder();
  bool _recorderInitialized = false;
  String? _recordingPath;
  final RxBool isRecording = false.obs;

  // ── Lifecycle ────────────────────────────────────────────────────────────────

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    id.value = args['id'] ?? '';
    _initRecorder();
    fetchdetails();
  }

  @override
  void onClose() {
    _disconnectSocket();
    _recorder.closeRecorder();
    messageController.dispose();
    scrollController.dispose();
    super.onClose();
  }

  Future<void> _initRecorder() async {
    await _recorder.openRecorder();
    _recorderInitialized = true;
  }

  // ── Existing API call (untouched) ────────────────────────────────────────────

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
      communityDetails.value = CommunityChatDetailsModel.fromJson(
        response2['data'],
      );
      final data = response2['data'];
      print(data);
      _connectSocket();
    } on AppException catch (e) {
      print(e.message);
      Get.snackbar("Error", e.message);
    } finally {
      isLoading.value = false;
    }
  }

  // ── WebSocket ────────────────────────────────────────────────────────────────

  void _connectSocket() {
    if (id.value.isEmpty) return;
    if (isConnected.value || isConnecting.value) return;

    isConnecting.value = true;

    try {
      final storage = GetStorage();
      final token = storage.read('token');

      final uri = Uri.parse(
        '$_wsBaseUrl/ws/community/${id.value}/?token=$token',
      );

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
        final List<dynamic> list = data['messages'] ?? [];
        messages.assignAll(
          list.map((m) => ChatMessage.fromJson(m as Map<String, dynamic>)),
        );
        _scrollToBottom();
      } else if (type == 'chat_message') {
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
    Get.snackbar(
      'Connection Lost',
      'Reconnecting...',
      duration: const Duration(seconds: 2),
    );
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

  // ── Helpers ──────────────────────────────────────────────────────────────────

  void _scrollToBottom() {
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

  bool isMyMessage(ChatMessage msg) {
    final storage = GetStorage();
    final myId = storage.read('user_id');
    return msg.sender.id.toString() == myId?.toString();
  }

  // ── Media Upload ──────────────────────────────────────────────────────────────

  Future<void> sendImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );

      if (pickedFile == null) return;

      final storage = GetStorage();
      final token = storage.read('token');

      final formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(
          // ✅ field name is 'image'
          pickedFile.path,
          filename: pickedFile.name,
          contentType: DioMediaType('image', 'jpeg'),
        ),
      });
      print(id.value);
      final response = await DioClient().postFormData(
        url: '${ApiConfig.baseUrl}/api/community/${id.value}/upload-media/',
        data: formData,
        headers: {'Authorization': 'Bearer $token'},
      );

      final body = response.data;

      if (response.statusCode == 200 || response.statusCode == 201) {
        final fileUrl =
            body['data']['data']['image_url']; // 🔁 adjust to match your response key
        final payload = jsonEncode({
          'message': '',
          'message_type': 'image', // 🔁 adjust if backend expects different
        });
        _channel?.sink.add(payload);
      } else {
        Get.snackbar('Upload Failed', body['message'] ?? 'Image upload failed');
      }
    } on AppException catch (e) {
      print('[IMAGE UPLOAD] Error: ${e.message}');
      Get.snackbar('Error', e.message);
    } catch (e) {
      print('[IMAGE UPLOAD] Error: $e');
      Get.snackbar('Error', 'Could not send image');
    }
  }
Future<void> startRecording() async {
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

Future<void> stopAndSendAudio() async {
  final filePath = await _recorder.stopRecorder();
  isRecording.value = false;

  if (filePath == null) return;

  try {
    final storage = GetStorage();
    final token = storage.read('token');

    final formData = FormData.fromMap({
      'audio': await MultipartFile.fromFile(
        filePath,
        filename: 'audio.aac',
        contentType: DioMediaType('audio', 'aac'),
      ),
    });

    final response = await DioClient().postFormData(
      url: '${ApiConfig.baseUrl}/api/community/${id.value}/upload-media/',
      data: formData,
      headers: {'Authorization': 'Bearer $token'},
    );

    final body = response.data;

    if (response.statusCode == 200 || response.statusCode == 201) {
      final fileUrl = body['data']['data']['audio_url'];
      final payload = jsonEncode({
        'message': '',
        'message_type': 'audio',
      });
      _channel?.sink.add(payload);
    } else {
      Get.snackbar('Upload Failed', body['message'] ?? 'Audio upload failed');
    }
  } on AppException catch (e) {
    print('[AUDIO SEND] Error: ${e.message}');
    Get.snackbar('Error', e.message);
  } catch (e) {
    print('[AUDIO SEND] Error: $e');
    Get.snackbar('Error', 'Could not send audio');
  } finally {
    try {
      File(filePath).deleteSync();
    } catch (_) {}
  }
}
}
