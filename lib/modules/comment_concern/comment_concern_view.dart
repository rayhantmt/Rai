import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rai/utils/app_images.dart';

class CommentConcernView extends StatelessWidget {
  const CommentConcernView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppImages.primarycolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Get.height*0.1,
            ),
            Row(
              children: [
                Image.asset(AppImages.commentconcernbackicon)
              ],
            )
          ],
        ),
      ),
    );
  }
}