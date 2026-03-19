import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rai/api_services/api_config.dart';
import 'package:rai/api_services/api_services.dart';
import 'package:rai/exceptions/app_exceptions.dart';

class CommunityChatDetailsController extends GetxController {
  var id = ''.obs;
  var name = ''.obs;
  var img = ''.obs;
  var member = ''.obs;

  @override
  void onInit() {
    super.onInit();

    final args = Get.arguments;

    id.value = args['id'];
  }

  RxBool isLoading = false.obs;
  Future<void> fetchdetails() async {
    isLoading.value = true;
    try {
      final storage = GetStorage();
      final token = storage.read('token');
      final response2 = await ApiService.get(
        endpoint: '/api/community/${id.value}/',
        headers: {'Authorization': 'Bearer $token'},
      );
      print(response2);
      //final storage = GetStorage();
      final data = response2['data'];
      print(data);
    } on AppException catch (e) {
      print(e.message);
      Get.snackbar("Error", e.message);
    } finally {
      isLoading.value = false;
    }
  }
}
