import 'package:get/get.dart';
import 'package:rai/modules/otp_page/email_otp/email_otp_controller.dart';

class EmailOtpBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<EmailOtpController>(() => EmailOtpController(),);
  }
} 