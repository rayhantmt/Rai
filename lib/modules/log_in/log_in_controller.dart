import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rai/api_services/api_config.dart';
import 'package:rai/api_services/api_services.dart';
import 'package:rai/exceptions/app_exceptions.dart';
import 'package:rai/utils/app_pages.dart';

class LogInController extends GetxController {
  RxBool pass = false.obs;
  void togglepass() {
    pass.value = !pass.value;
  }

  RxBool ischeck = false.obs;
  void togglechekc(val) {
    ischeck.value = val;
  }

  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  RxBool isLoading = false.obs;
  Future<void> login() async {
    isLoading.value = true;
    final body = {
      "username": emailcontroller.text,
      "password": passwordcontroller.text,
    };
    try {
      final response = await ApiService.post(
        endpoint: ApiConfig.login,
        body: body,
      );
      final storage = GetStorage();
      final accessToken = response['data']['access'];
      await storage.write('token', accessToken);
      final token=storage.read('token');
        final response2 = await ApiService.get(
        endpoint: ApiConfig.getprofile,
        headers: {'Authorization': 'Bearer $token'},
      );
      print(response2);
      //final storage = GetStorage();
      final data = response2['data'];
      storage.write('firstname', data['first_name']);
      storage.write('lastname', data['last_name']);
      storage.write('username', data['username']);
      storage.write('profileimage', data['profile_picture']);
      storage.write('dateofbirth', data['date_of_birth']);
      storage.write('bio', data['bio']);
      Get.offAllNamed(AppPages.mainscreen);
    } on AppException catch (e) {
      Get.snackbar("Login Failed", e.message);
    } finally {
      isLoading.value = false;
    }
  }
}
