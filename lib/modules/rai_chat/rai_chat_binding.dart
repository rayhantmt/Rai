import 'package:get/get.dart';
import 'package:rai/modules/rai_chat/rai_chat_controller.dart';

class RaiChatBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut<RaiChatController>(()=>RaiChatController());
  }
}