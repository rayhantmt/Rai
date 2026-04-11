// import 'package:get/get.dart';

// class GroupMemberCommunityController extends GetxController {
//   RxBool notificatio = true.obs;
//   void notification(bool) {
//     notificatio.value = bool;
//   }

//   RxInt gen = 0.obs;
//   void general(int) {
//     gen.value = int;
//   }
// }
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rai/api_services/api_services.dart';
import 'package:rai/modules/group_member_community/group_member_community_model.dart';

class GroupMemberCommunityController extends GetxController {
 // final int communityId;
  //GroupMemberCommunityController({required this.communityId});
var communityId;

  // All members from API
  final RxList<GroupMemberModel> members = <GroupMemberModel>[].obs;

  // Filtered list shown in UI
  final RxList<GroupMemberModel> filteredMembers = <GroupMemberModel>[].obs;

  final RxBool isLoading = false.obs;
  final RxString searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchMembers();
  }

  Future<void> fetchMembers() async {
    final token=GetStorage().read('token');
    communityId=Get.arguments['id'];
    print(communityId);
    try {
      isLoading(true);
      final response = await ApiService.get(
        endpoint: 
        '/api/community/$communityId/members/',
         headers: {'Authorization': 'Bearer $token'},
      );

      if (response != null && response['success'] == true) {
        final List data = response['data'];
        members.value = data.map((e) => GroupMemberModel.fromJson(e)).toList();
        filteredMembers.value = members; // init filtered with all
      }
    } catch (e) {
      print('fetchMembers error: $e');
    } finally {
      isLoading(false);
    }
  }

  void searchMembers(String query) {
    searchQuery(query);
    if (query.trim().isEmpty) {
      filteredMembers.value = members;
    } else {
      filteredMembers.value = members.where((m) {
        final fullName = m.fullName.toLowerCase();
        final username = m.username.toLowerCase();
        final q = query.toLowerCase();
        return fullName.contains(q) || username.contains(q);
      }).toList();
    }
  }
}