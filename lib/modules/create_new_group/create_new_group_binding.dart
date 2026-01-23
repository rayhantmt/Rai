import 'package:get/get.dart';
import 'package:rai/modules/create_new_group/create_new_group_controller.dart';

class CreateNewGroupBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<CreateNewGroupController>(() => CreateNewGroupController(),);
  }
}