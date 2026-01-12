import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rai/utils/app_images.dart';

class RaiChatView extends StatelessWidget {
  const RaiChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppImages.primarycolor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: Get.height * 0.05),
            Row(
              children: [
                Image.asset(
                  AppImages.logo,
                  height: Get.height * 0.05,
                  width: Get.width * 0.2,
                ),
                Expanded(child: SizedBox()),
                Icon(
                  Icons.history,
                  size: Get.height * 0.04,
                  color: Color(0xffEEEEF0),
                ),
                Icon(
                  Icons.more_vert,
                  size: Get.height * 0.04,
                  color: Color(0xffEEEEF0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
