import 'package:get/get.dart';
import 'package:rai/modules/community_details/community_details_controller.dart';

class UpdateCommunityBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<UpdateCommunityController>(() => UpdateCommunityController(),);
  }
}