import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MainScreenController extends GetxController {


  var pagetype = 2.obs;
  void setpagetype(int) {
    pagetype.value = int;
  }

  final token = GetStorage().read('token');
  
}
