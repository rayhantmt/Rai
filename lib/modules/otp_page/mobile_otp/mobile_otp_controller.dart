import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MobileOtpController extends GetxController{
  RxString otp = ''.obs;
  RxBool isButtonEnabled = false.obs;
  RxInt secondsRemaining = 60.obs;
  Timer? timer;
 
  final isLoading = false.obs; 

  // For 6 separate OTP fields
  final List<TextEditingController> otpControllers = List.generate(
    6,
    (_) => TextEditingController(),
  );
  final List<FocusNode> otpFocusNodes = List.generate(6, (_) => FocusNode());

  @override
  void onInit() {
    super.onInit();
    startTimer();
    for (var i = 0; i < 6; i++) {
      otpControllers[i].addListener(() {
        otp.value = otpControllers.map((c) => c.text).join();
        isButtonEnabled.value = otp.value.length == 6;
      });
    }
  }

  void startTimer() {
    secondsRemaining.value = 60;
    timer?.cancel();
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      if (secondsRemaining.value == 0) {
        t.cancel();
      } else {
        secondsRemaining.value--;
      }
    });
  }

  void resendCode() {
    if (secondsRemaining.value == 0) {
      startTimer();
      Get.snackbar("OTP", "New OTP sent");
    }
  }

  // void verifyOtp() {
  //   if (otp.value.length == 6) {
  //     // Simulate API call
  //     Get.snackbar("OTP Verified", "Proceeding to next step...");
  //   }
  // }

  void onOtpFieldChanged(String value, int index) {
    if (value.isNotEmpty && index < 5) {
      otpFocusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      otpFocusNodes[index - 1].requestFocus();
    }
    otp.value = otpControllers.map((c) => c.text).join();
    isButtonEnabled.value = otp.value.length == 6;
  }
}