import 'package:get/get.dart';

class AccountSettingsController extends GetxController{
  var screetype=0.obs;
  void toggleScreen(int a){
    screetype.value=a;
  }
  var obsecured=false.obs;
  var obsecured1=false.obs;
  var obsecured2=false.obs;
  void toggle(){
    obsecured.value=!obsecured.value;
  }
  void toggle1(){
    obsecured1.value=!obsecured1.value;
  }
  void toggle2(){
    obsecured2.value=!obsecured2.value;
  }
}