import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rai/modules/otp_page/email_otp/email_otp_controller.dart';
import 'package:rai/utils/app_images.dart';

class EmailOtpView extends GetView<EmailOtpController> {
  const EmailOtpView({super.key});

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
              SizedBox(
                height: Get.height*0.2,
        
              ),
              Text('Verify Your Identity',
              style: GoogleFonts.manrope( 
                fontWeight: FontWeight.w600,
                fontSize: 24,
                color: Colors.white
              ),
              ),
              SizedBox(height: Get.height*0.02,),
              Text('Enter the code sent to your email alex.647@gmail.com',
              style: GoogleFonts.manrope( 
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.white
              ),
              )
             ],
          ),
        ),
      ),
    );
  }
}