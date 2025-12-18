import 'package:get/get.dart';
import 'package:rai/modules/log_in/log_in_controller.dart';

class LogInBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut<LogInController>(  () => LogInController(),);
  }
}