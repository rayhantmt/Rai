import 'package:get/get.dart';

class GroupMemberCommunityController extends GetxController{
RxBool notificatio=true.obs;
  void notification(bool){
    notificatio.value=bool;
  }
RxInt gen=0.obs;
void general(int){
gen.value=int;
}

}