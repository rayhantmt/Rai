import 'package:get/get.dart';
import 'package:rai/modules/more_section/more_section_controller.dart';

class MoreSectionBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<MoreSectionController>(()=>MoreSectionController());
  }
}