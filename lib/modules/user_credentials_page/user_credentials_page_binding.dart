import 'package:get/get.dart';
import 'package:rai/modules/user_credentials_page/user_credentials_page_controller.dart';

class UserCredentialsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserCredentialsPageController>(() => UserCredentialsPageController(),);
  }
}