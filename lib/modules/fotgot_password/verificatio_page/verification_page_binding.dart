import 'package:get/get.dart';
import 'package:rai/modules/fotgot_password/verificatio_page/verification_page_contorller.dart';

class VerificationPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<VerificationPageContorller>(
      () => VerificationPageContorller(),
    );
  }
}