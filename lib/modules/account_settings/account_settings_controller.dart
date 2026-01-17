import 'package:get/get.dart';

class AccountSettingsController extends GetxController{
  var screetype=0.obs;
  void toggleScreen(int a){
    screetype.value=a;
  }
}