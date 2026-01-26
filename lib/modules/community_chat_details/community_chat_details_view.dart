import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rai/utils/app_images.dart';

class CommunityChatDetailsView extends StatelessWidget {
  const CommunityChatDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppImages.primarycolor,
      body: Column(
        children: [
          SizedBox(height: Get.height * 0.04),
          Row(
            children: [
              Image.asset(
                AppImages.commentconcernbackicon,
                height: Get.height * 0.01,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
