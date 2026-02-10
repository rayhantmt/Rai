import 'package:get/get.dart';
import 'package:rai/modules/community/community_controller.dart';
import 'package:rai/modules/main_screen/main_screen_controller.dart';
import 'package:rai/modules/rais_picks/rais_pics_controller.dart';

class MainScreenBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<MainScreenController>(() => MainScreenController(),);
    Get.lazyPut<CommunityController>(() => CommunityController());
    Get.lazyPut<RaisPicsController>(() => RaisPicsController(),);
  }
}