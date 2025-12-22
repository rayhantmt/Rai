import 'package:get/get.dart';

class UserCredentialsPageController extends GetxController {
  var isobsecured =false.obs;
  var isobsecured1= false.obs;
  void toggle1(){
    isobsecured.value=!isobsecured.value;
  }
  void toggle2(){
    isobsecured1.value=!isobsecured1.value;
  }
}