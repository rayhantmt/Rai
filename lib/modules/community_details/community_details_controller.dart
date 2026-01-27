
import 'package:get/get.dart';

class UpdateCommunityController extends GetxController {
  RxBool notificatio=true.obs;
  void notification(bool){
    notificatio.value=bool;
  }
}
