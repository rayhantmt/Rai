import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rai/utils/app_images.dart';

class LogInView extends StatelessWidget {
  const LogInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff19191B),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Get.height*0.1,),
            Image.asset(AppImages.logo,
            height: Get.height*0.1,
            width: Get.width*0.3,
            )
          ],
        ),
      ),
    );
  }
}