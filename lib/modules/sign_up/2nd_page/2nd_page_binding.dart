import 'package:get/get.dart';
import 'package:rai/modules/sign_up/2nd_page/2nd_page_controller.dart';

class SecondPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SecondPageController>(() => SecondPageController(),);
  }
  
}