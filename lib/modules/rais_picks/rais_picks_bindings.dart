import 'package:get/get.dart';
import 'package:rai/modules/rais_picks/rais_pics_controller.dart';

class RaisPicksBindings extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut<RaisPicsController>(()=>RaisPicsController());
  }
}