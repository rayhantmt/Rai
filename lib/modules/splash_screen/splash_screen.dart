import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rai/utils/app_images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(child: Image.asset(AppImages.logo,
      height: Get.height*0.2,
      width: Get.width*0.7,
      ),),
    );
  }
}