import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:get_storage/get_storage.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:rai/api_services/api_config.dart';
import 'package:rai/api_services/doi_services.dart';
import 'package:rai/exceptions/app_exceptions.dart';


class EditProfileController extends GetxController {
    final DioClient _client = DioClient();
  Rx<DateTime> birthdate = DateTime.now().obs;
  final ImagePicker _picker = ImagePicker();
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
  final biocontroller=TextEditingController();
  final firstnamecontrolle=TextEditingController();
  final lastnamecontroller=TextEditingController();
Future<void> updateProfile() async {
  final token=GetStorage().read('token');
    isLoading.value = true;

    try {
      final formData = FormData.fromMap({
        'first_name': firstnamecontrolle.text,
        'bio': biocontroller.text,
        'last_name': lastnamecontroller.text,
        'profile_picture': await MultipartFile.fromFile(
          profileImage.value!.path,
          filename: profileImage.value!.name,
          contentType: MediaType('image', 'png'),
        ),
        'date_of_birth': DateFormat('yyyy-MM-dd').format(birthdate.value),
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

      final response = await _client.putFormData(
        url: '${ApiConfig.baseUrl}/api/auth/profile/update/',
        data: formData,
         headers: {'Authorization': 'Bearer $token'},
      );

      // --- PRINT RESPONSE START ---
      print('✅ --- RESPONSE RECEIVED ---');
      print('Status Code: ${response.statusCode}');
      print('Data: ${response.data}');
      // --- PRINT RESPONSE END ---

      Get.snackbar('Success', 'User Created Successfully log in now');
      //Get.toNamed(AppPages.login);
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
  
  final firstname=GetStorage().read('firstname')??"Error loading name";
  final lastname=GetStorage().read('lastname')??'';
  final profileimage=GetStorage().read('profileimage')??"loading";
  final username=GetStorage().read('username');
  final bio=GetStorage().read('bio');
  final dateofbirth=GetStorage().read('dateofbirth');
}
