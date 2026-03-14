import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rai/api_services/api_config.dart';
import 'package:rai/api_services/api_services.dart';
import 'package:rai/exceptions/app_exceptions.dart';
import 'package:rai/modules/community/community_model.dart';

class CommunityController extends GetxController {
  var communities = <CommunityModel>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCommunities();
  }

  Future<void> fetchCommunities() async {
     final storage = GetStorage();
    final token = storage.read('token');
    try {
      isLoading.value = true;
      final response = await ApiService.get(endpoint: ApiConfig.getcommunity,
        headers: {'Authorization': 'Bearer $token'},
      );
      
      if (response['success'] == true) {
        final List data = response['data'];
        communities.value = data.map((e) => CommunityModel.fromJson(e)).toList();
      }
    } on BadRequestException catch (e) {
      Get.snackbar('Error', e.toString());
    } on UnauthorizedException catch (e) {
      Get.snackbar('Unauthorized', e.toString());
    } on NotFoundException catch (e) {
      Get.snackbar('Not Found', e.toString());
    } on FetchDataException catch (e) {
      Get.snackbar('Network Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
