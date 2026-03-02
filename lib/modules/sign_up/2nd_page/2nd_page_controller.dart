import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rai/api_services/api_config.dart';
import 'package:rai/api_services/api_services.dart';
import 'package:rai/exceptions/app_exceptions.dart';
import 'package:rai/utils/app_pages.dart';

class SecondPageController extends GetxController{
  var signuptype=0.obs;
  void setsignintype(int t){
    signuptype.value=t;
  }
  final emailcontroller=TextEditingController();
  RxBool isLoading = false.obs;

  Future<void> login() async {
    isLoading.value = true;

    final body = {
     
        "identifier": emailcontroller.text.trim().toLowerCase(),
      
    };
    try {
      final response = await ApiService.post(
        endpoint: ApiConfig.emailurl, 
        body: body,
      );
      
      print("Otp sent $response");
      Get.toNamed(AppPages.emailotp,arguments: {
        'email':emailcontroller.text.toLowerCase()
      });
    } on AppException catch (e) {
      Get.snackbar("Login Failed", e.message);
    } finally {
      isLoading.value = false;
    }
  }

}