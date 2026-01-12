import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:rai/modules/community/community_controller.dart';

class CommunityBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut<CommunityController>(()=>CommunityController());
  }
}