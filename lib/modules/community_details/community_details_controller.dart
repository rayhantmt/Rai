
import 'package:get/get.dart';

class CommunityDetailsController extends GetxController {
  RxBool notificatio=true.obs;
  void notification(bool){
    notificatio.value=bool;
  }
}
