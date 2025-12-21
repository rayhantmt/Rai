import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rai/utils/app_images.dart';

class SecondPageView extends StatelessWidget {
  const SecondPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppImages.primarycolor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Get.height * 0.1),
              Text(
                'Create an account!',
                style: GoogleFonts.manrope(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: Get.height*0.02,),
              Text('To complete the sign up process please enter your valid email or phone number',
              style: GoogleFonts.manrope( 
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.white
              ),
              ),
              SizedBox(height: Get.height*0.03,)
            ],
          ),
        ),
      ),
    );
  }
}
