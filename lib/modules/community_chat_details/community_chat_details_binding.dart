import 'package:get/get.dart';
import 'package:rai/modules/community_chat_details/community_chat_details_controller.dart';

class CommunityChatDetailsBinding extends Bindings{
  @override
  void dependencies() {
 Get.lazyPut<CommunityChatDetailsController>(() => CommunityChatDetailsController(),);
  }
}