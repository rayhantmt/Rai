import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rai/api_services/api_config.dart';
import 'package:rai/api_services/api_services.dart';
import 'package:rai/exceptions/app_exceptions.dart';
import 'package:rai/utils/app_pages.dart';

class VerificationPageContorller extends GetxController {
  var signuptype = 0.obs;
  void setsignintype(int t) {
    signuptype.value = t;
  }

  final emailcontroller = TextEditingController();
  RxBool isLoading = false.obs;
  Future<void> requestOtp() async {
    isLoading.value = true;
    final body = {"identifier": emailcontroller.text};
    try {
     
      final response2 = await ApiService.post(
        body: body,
        endpoint: ApiConfig.forgotpassotprequest,
        // headers: {'Authorization': 'Bearer $token'},
      );
      print(response2);
      if (response2.statusCode == 200 || response2.statusCode == 201) {
        Get.snackbar('Success', response2['message']);
        Get.toNamed(AppPages.emailotpfp);
      }
    } on AppException catch (e) {
      Get.snackbar("Otp Request Failed", e.message);
    } finally {
      isLoading.value = false;
    }
  }
}
