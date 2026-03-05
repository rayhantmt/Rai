import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rai/api_services/api_config.dart';
import 'package:rai/api_services/api_services.dart';
import 'package:rai/exceptions/app_exceptions.dart';

class MainScreenController extends GetxController {
  @override
  void onInit() {
    if (GetStorage().read('firstname') == null) {
      getprofile();
    } else {
      print("Profile already loaded: ${GetStorage().read('firstname')}");
    }
    super.onInit();
  }

  var pagetype = 2.obs;
  void setpagetype(int) {
    pagetype.value = int;
  }

  final token = GetStorage().read('token');
  RxBool isLoading = false.obs;
  Future<void> getprofile() async {
    isLoading.value = true;
    try {
      final response = await ApiService.get(
        endpoint: ApiConfig.getprofile,
        headers: {'Authorization': 'Bearer ${token}'},
      );
      print(response);
      final storage = GetStorage();
      final data = response['data'];
      storage.write('firstname', data['first_name']);
      storage.write('lastname', data['last_name']);
      storage.write('username', data['username']);
      storage.write('profileimage', data['profile_picture']);
      storage.write('dateofbirth', data['date_of_birth']);
      storage.write('bio', data['bio']);
    } on AppException catch (e) {
      print(e.toString());
      Get.snackbar('Error', e.toString());
    }
  }
}
