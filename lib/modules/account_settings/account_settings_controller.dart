import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rai/api_services/api_config.dart';
import 'package:rai/api_services/api_services.dart';
import 'package:rai/exceptions/app_exceptions.dart';

class AccountSettingsController extends GetxController {
  var screetype = 0.obs;
  void toggleScreen(int a) {
    screetype.value = a;
  }

  var obsecured = false.obs;
  var obsecured1 = false.obs;
  var obsecured2 = false.obs;
  void toggle() {
    obsecured.value = !obsecured.value;
  }

  void toggle1() {
    obsecured1.value = !obsecured1.value;
  }

  void toggle2() {
    obsecured2.value = !obsecured2.value;
  }

  final token = GetStorage().read('token');
  final firstname = GetStorage().read('firstname') ?? "Error loading name";
  final lastname = GetStorage().read('lastname') ?? '';
  final profileimage = GetStorage().read('profileimage') ?? "loading";
  final username = GetStorage().read('username');
  final bio = GetStorage().read('bio');
  final dateofbirth = GetStorage().read('dateofbirth');
  RxBool isLoading = false.obs;

  final oldpassword = TextEditingController();
  final newpassword = TextEditingController();
  final confirmpassword = TextEditingController();

  Future<void> changePassword() async {
    isLoading.value = true;

    final token = GetStorage().read('token');
    if (token == null) {
      Get.snackbar("Error", "Token not found");
      isLoading.value = false;
      return;
    }

    final body = {
        "old_password": oldpassword.text,
        "new_password": newpassword.text,
        "confirm_new_password": confirmpassword.text,
      };

    try {
      final response = await ApiService.post(
        endpoint: ApiConfig.changePassword,
        body: body,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      Get.back();
      print("Password Chagned successfully: $response");
      Get.snackbar("Success", "Password Updated Successfully");
    } on AppException catch (e) {
      Get.snackbar(
        "Password Changed Failed",
        e.message,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
