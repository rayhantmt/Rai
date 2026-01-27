import 'package:get/get.dart';
import 'package:rai/modules/update_community/update_community_controller.dart';

class UpdateCommunityBinding extends Bindings{
  @override
  void dependencies() {
  Get.lazyPut<UpdateCommunityController>(() => UpdateCommunityController(),);
  }
}