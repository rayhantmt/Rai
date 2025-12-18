import 'package:get/get.dart';

class LogInController extends GetxController{
  RxBool pass=false.obs;
  void togglepass(){
    pass.value=!pass.value;
  }
  RxBool ischeck=false.obs;
  void togglechekc(val){
    ischeck.value=val;
  }
}