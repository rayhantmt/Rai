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
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            SizedBox(height: Get.height*0.05,),
            Row(
              children: [
                Image.asset(AppImages.aiicon)
              ],
            )
          ],
        ),
      )
    );
  }
}