import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rai/utils/app_images.dart';

class SetProfileView extends StatelessWidget {
  const SetProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppImages.primarycolor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Get.height * 0.1),
              Text(
                'Set up your profile!',
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: Get.height * 0.02),
              Text(
                'Set your photo and  add details to get started',
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color(0xffB2B3BD),
                ),
              ),
              SizedBox(height: Get.height * 0.03),
              Row(
                children: [
                  Container(
                    height: Get.height * 0.15,
                    width: Get.width * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(150),
                      color: Color(0xffB2B3BD),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
