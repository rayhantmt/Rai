import 'package:get/get.dart';
import 'package:rai/modules/admin_community_get_requests/admin_community_get_requests_conroller.dart';

class AdminCommunityGetRequestsBinding extends Bindings{
  @override
  void dependencies() {
Get.lazyPut<AdminCommunityGetRequestsConroller>(() => AdminCommunityGetRequestsConroller(),);
  }
}