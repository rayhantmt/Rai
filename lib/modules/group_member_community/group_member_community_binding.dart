import 'package:get/get.dart';
import 'package:rai/modules/group_member_community/group_member_community_controller.dart';

class GroupMemberCommunityBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<GroupMemberCommunityController>(() => GroupMemberCommunityController(),);
  }
}