import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:rai/modules/join_community/join_community_controller.dart';
import 'package:rai/utils/app_images.dart';

class JoinCommunityView extends GetView<JoinCommunityController> {
  const JoinCommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppImages.primarycolor,
    );
  }
}