import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rai/utils/app_images.dart';

class MoreSectionView extends StatelessWidget {
  const MoreSectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppImages.primarycolor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: Get.height * 0.07),

              Text(
                'More Tools',
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                  color: Color(0xffEEEEF0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
