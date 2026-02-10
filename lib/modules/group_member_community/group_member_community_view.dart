import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rai/utils/app_images.dart';

class GroupMemberCommunityView extends StatelessWidget {
  const GroupMemberCommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppImages.primarycolor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: Get.height*0.06,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Image.asset(AppImages.commentconcernbackicon,
                  height: Get.height*0.06,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}