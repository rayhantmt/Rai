import 'package:get/get.dart';
import 'package:rai/modules/set_profile/set_up_profile_controller.dart';

class SetUpProfileBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SetUpProfileController>(() => SetUpProfileController(),);
  }
}