
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rai/api_services/api_config.dart';
import 'package:rai/api_services/api_services.dart';
import 'package:rai/exceptions/app_exceptions.dart';

class CommunityDetailsController extends GetxController {
  RxBool notificatio=true.obs;
  void notification(bool){
    notificatio.value=bool;
  }
  RxBool isLoading = false.obs;
  Future<void> deletecommunity( var id) async {
    isLoading.value = true;
    try {
      final storage = GetStorage();
      final token = storage.read('token');
      final response2 = await ApiService.delete(
        endpoint: '/api/community/$id',
        headers: {'Authorization': 'Bearer $token'},
      );
      print(response2);  
    } on AppException catch (e) {
      Get.snackbar("Delete Failed", e.message);
    } finally {
      isLoading.value = false;
    }
  }
}
