import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rai/modules/otp_page/email_otp/email_otp_controller.dart';
import 'package:rai/utils/app_images.dart';

class EmailOtpView extends GetView<EmailOtpController> {
  const EmailOtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppImages.primarycolor,
    );
  }
}