import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rai/utils/app_images.dart';

class CommunityView extends GetView {
  const CommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppImages.primarycolor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: Get.height * 0.07),
                  Text(
                    'Community',
                    style: GoogleFonts.manrope(
                      color: Color(0xffEEEEF0),
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: Get.height * 0.15, 
            right: 20,
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: Color(0xff303136),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.add, color: Color(0xffEEEEF0), size: 30),
            ),
          ),
        ],
      ),
    );
  }
}
