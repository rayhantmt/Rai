import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:get_storage/get_storage.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rai/api_services/api_config.dart';
import 'package:rai/api_services/doi_services.dart';
import 'package:rai/exceptions/app_exceptions.dart';
import 'package:rai/modules/community/community_controller.dart';
import 'package:rai/utils/app_pages.dart';

class CreateNewGroupController extends GetxController {
  final controller=Get.find<CommunityController>();
  RxBool isPrivate = true.obs;
  void private(bool b) {
    isPrivate.value = b;
  }

  final ImagePicker _picker = ImagePicker();
  final DioClient _client = DioClient();

  Rxn<XFile> profileImage = Rxn<XFile>();
  Future<void> pickProfileImage() async {
    try {
      final XFile? picked = await _picker.pickImage(
        source: ImageSource.gallery,
      );
      if (picked != null) {
        profileImage.value = picked;
      } else {
        print('Profile pick cancelled');
      }
    } catch (e) {
      print('Error picking profile image: $e');
      Get.snackbar('Error', 'Failed to pick profile image: $e');
    }
  }

  final namecontroller = TextEditingController();
  final descriptioncontroller = TextEditingController();
  RxBool isLoading = false.obs;
  Future<void> createGroup() async {
    final storage = GetStorage();
    final token = storage.read('token');
    isLoading.value = true;

    try {
      final formData = FormData.fromMap({
        'profile_picture': await MultipartFile.fromFile(
          profileImage.value!.path,
          filename: profileImage.value!.name,
          contentType: MediaType('image', 'png'),
        ),
        'name': namecontroller.text,
        'description': descriptioncontroller.text,
        'is_private': isPrivate.value,
      });

      // --- PRINT REQUEST BODY START ---
      print('🚀 --- SENDING POST REQUEST ---');
      print('URL: ${ApiConfig.baseUrl}/api/community/');
      print('FIELDS:');
      for (var field in formData.fields) {
        print('  ${field.key}: ${field.value}');
      }
      print('FILES:');
      for (var file in formData.files) {
        print(
          '  ${file.key}: ${file.value.filename} (${file.value.contentType})',
        );
      }

      final response = await _client.postFormData(
        url: '${ApiConfig.baseUrl}/api/community/',
        data: formData,
        headers: {'Authorization': 'Bearer $token'},
      );

      // --- PRINT RESPONSE START ---
      print('✅ --- RESPONSE RECEIVED ---');
      print('Status Code: ${response.statusCode}');
      print('Data: ${response.data}');
      // --- PRINT RESPONSE END ---

      Get.snackbar('Success', 'Group Created Successfully');
      controller.fetchCommunities();
      Get.toNamed(AppPages.mainscreen);
    } on BadRequestException catch (e) {
      // Caught by our custom DioClient logic
      Get.snackbar('Registration Failed', e.toString());
      print('❌ API Error:  $e');
    } on DioException catch (e) {
      // Catch generic Dio errors that might slip through
      Get.snackbar('Error', 'Network error: ${e.message}');
    } catch (e) {
      // Catch logic errors (like the one you were seeing)
      print('❌ Unexpected Error: $e');
      Get.snackbar('Error', 'Something went wrong: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
