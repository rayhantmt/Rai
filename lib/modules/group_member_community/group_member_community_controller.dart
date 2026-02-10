import 'package:get/get.dart';

class GroupMemberCommunityController extends GetxController{
RxBool notificatio=true.obs;
  void notification(bool){
    notificatio.value=bool;
  }

}