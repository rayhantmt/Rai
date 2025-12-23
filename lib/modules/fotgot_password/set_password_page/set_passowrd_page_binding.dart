import 'package:get/get.dart';
import 'package:rai/modules/fotgot_password/set_password_page/set_password_controller.dart';

class SetPassowrdPageBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut<SetPasswordController>(() => SetPasswordController(),);
  }
}