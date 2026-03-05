//import 'dart:js_interop';

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
  String email = '';
  String username = "";
  String password = "";
  String confirmPassword = "";

  @override
  void onInit() {
    super.onInit();

    // 2. The syntax to "get" the map values
    if (Get.arguments != null) {
      username = Get.arguments['username'] ?? "";
      password = Get.arguments['password'] ?? "";
      confirmPassword = Get.arguments['confirmpassowrd'] ?? "";
      email = Get.arguments['email'] ?? "email no passed from usercredintails";
    }

    print("Retrieved Username: $username");
  }

  final ImagePicker _picker = ImagePicker();
  final DioClient _client = DioClient();
  final birthdatecontroller = TextEditingController();
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
  final firstnamecontroller = TextEditingController();
  final lastnamecontroller = TextEditingController();
  final boicontroller = TextEditingController();
  RxBool isLoading = false.obs;
  Future<void> createUser() async {
    isLoading.value = true;

    try {
      // final formData = FormData.fromMap({
      //   'identifier': email,
      //   'username': username,
      //   // 'name': namecontroller.text,
      //   'password': password,
      //   'first_name': firstnamecontroller.text,
      //   'last_name': lastnamecontroller.text,
      //   'profile_picture': await MultipartFile.fromFile(
      //     profileImage.value!.path,
      //     filename: profileImage.value!.name,
      //     contentType: MediaType('image', 'png'),
      //   ),
      //   'date_of_birth': birthdatecontroller.text,
      //   'bio': boicontroller.text,
      // });

      // // 4. API Call
      // final response = await _client.postFormData(
      //   url: '${ApiConfig.baseUrl}/api/auth/signup/finalize/',
      //   data: formData,
      // );

      // print('✅ User Created: ${response.data}');
      // Get.snackbar('Success', 'User Created Successfully log in now');
      // Get.toNamed(AppPages.login);
      final formData = FormData.fromMap({
        'identifier': email,
        'username': username,
        'password': password,
        'first_name': firstnamecontroller.text,
        'last_name': lastnamecontroller.text,
        'profile_picture': await MultipartFile.fromFile(
          profileImage.value!.path,
          filename: profileImage.value!.name,
          contentType: MediaType('image', 'png'),
        ),
        'date_of_birth': birthdatecontroller.text,
        'bio': boicontroller.text,
      });

      // --- PRINT REQUEST BODY START ---
      print('🚀 --- SENDING POST REQUEST ---');
      print('URL: ${ApiConfig.baseUrl}/api/auth/signup/finalize/');
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
        url: '${ApiConfig.baseUrl}/api/auth/signup/finalize/',
        data: formData,
      );

      // --- PRINT RESPONSE START ---
      print('✅ --- RESPONSE RECEIVED ---');
      print('Status Code: ${response.statusCode}');
      print('Data: ${response.data}');
      // --- PRINT RESPONSE END ---

      Get.snackbar('Success', 'User Created Successfully log in now');
      Get.toNamed(AppPages.login);
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
