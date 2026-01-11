import 'package:get/get.dart';

class HomeController extends GetxController{
  var pagetype=0.obs;
  void setpagetype (int){
    pagetype.value=int;
  }
}