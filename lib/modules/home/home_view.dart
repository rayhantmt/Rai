import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rai/utils/app_images.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppImages.primarycolor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: Get.height*0.05,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AppImages.logo,
                height: Get.height*0.05,
                ),
                Image.asset(AppImages.notificationicon,
                height: Get.height*0.06,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}