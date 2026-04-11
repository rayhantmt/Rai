import 'package:get/get.dart';
import 'package:rai/modules/join_community/join_community_controller.dart';

class JoinCommunityBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<JoinCommunityController>(() => JoinCommunityController(),);
  }
} 