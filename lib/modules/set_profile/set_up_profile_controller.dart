import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rai/api_services/api_config.dart';
import 'package:rai/api_services/doi_services.dart';
import 'package:rai/exceptions/app_exceptions.dart';
import 'package:rai/utils/app_pages.dart';

class SetUpProfileController extends GetxController {
  final ImagePicker _picker = ImagePicker();
final DioClient _client = DioClient();
final birthdatecontroller=TextEditingController();
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
  RxBool isLoading=false.obs;
  Future<void> createUser() async {
    isLoading.value = true;

    try {
      final formData = FormData.fromMap({
        // 'identifier': email,
        // 'username': passwordcontroller.text,
        // 'name': name,
        // 'password': gender,
        // 'first_name': biocontroller.text,
        // 'last_name': nationality,
        'profile_picture': await MultipartFile.fromFile(
          profileImage.value!.path,
          filename: profileImage.value!.name,
          contentType: MediaType('image', 'png'),
        ),
        
      });

      // 4. API Call
      final response = await _client.postFormData(
        url: '${ApiConfig.baseUrl}/api/auth/signup/finalize/',
        data: formData,
      );

      print('✅ User Created: ${response.data}');
      Get.snackbar('Success', 'User Created Successfully');
      Get.toNamed(AppPages.home);
    } on BadRequestException catch (e) {
      // Caught by our custom DioClient logic
      Get.snackbar('Registration Failed', e.toString());
      print('❌ API Error: $e');
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
