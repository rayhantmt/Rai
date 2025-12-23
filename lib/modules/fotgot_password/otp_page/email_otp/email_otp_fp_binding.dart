import 'package:get/get.dart';
import 'package:rai/modules/fotgot_password/otp_page/email_otp/email_otp_fp_controller.dart';

class EmailOtpFpBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<EmailOtpFpController>(() => EmailOtpFpController(),);
  }
}