import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

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
  final token=GetStorage().read('token');
  final firstname=GetStorage().read('firstname')??"Error loading name";
  final lastname=GetStorage().read('lastname')??'';
  final profileimage=GetStorage().read('profileimage')??"loading";
  final username=GetStorage().read('username');
  final bio=GetStorage().read('bio');
  final dateofbirth=GetStorage().read('dateofbirth');
}