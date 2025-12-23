import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rai/common_widgets/common_button.dart';
import 'package:rai/common_widgets/common_textfield.dart';
import 'package:rai/utils/app_images.dart';

class SetPasswordPageView extends StatelessWidget {
  const SetPasswordPageView({super.key});

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
              SizedBox(height: Get.height*0.1,),
              Text('Set a strong password!',
              style: GoogleFonts.manrope( 
                color: Color(0xffEEEEF0),
                fontWeight: FontWeight.w600,
                fontSize: 24
              ),
              ),
              SizedBox(height: Get.height*0.02,),
              Text('Set a strong password to secure account',
              style: GoogleFonts.manrope( 
                color: Color(0xffB2B3BD),
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
              ),
              SizedBox(height: Get.height*0.03,),
              Commontextfield(tittle: 'New password', hint: 'Enter a strong passowrd', obsecuretext: true),
              SizedBox(height: Get.height*0.03,),
              Commontextfield(tittle: 'Confirm New password', hint: 'Re-enter the new passowrd', obsecuretext: true),
              SizedBox(height: Get.height*0.03,),
              CommonButton(tittle: 'Set New Password')
            ],
          ),
        ),
      ),
    );
  }
}