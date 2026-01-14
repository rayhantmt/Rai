import 'package:get/get.dart';

class MainScreenController extends GetxController{
  var pagetype=2.obs;
  void setpagetype (int){
    pagetype.value=int;
  }
}