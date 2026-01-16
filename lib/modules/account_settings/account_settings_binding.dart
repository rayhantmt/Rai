import 'package:get/get.dart';
import 'package:rai/modules/account_settings/account_settings_controller.dart';

class AccountSettingsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AccountSettingsController>(()=>AccountSettingsController());
  }
}