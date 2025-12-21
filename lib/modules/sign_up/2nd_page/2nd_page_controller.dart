import 'package:get/get.dart';

class SecondPageController extends GetxController{
  var signuptype=0.obs;
  void setsignintype(int t){
    signuptype.value=t;
  }
}