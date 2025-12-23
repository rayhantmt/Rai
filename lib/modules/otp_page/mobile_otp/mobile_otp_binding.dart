import 'package:get/get.dart';
import 'package:rai/modules/otp_page/mobile_otp/mobile_otp_controller.dart';

class MobileOtpBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<MobileOtpController>(() => MobileOtpController(),);
  }
}