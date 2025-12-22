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
        child: Column(
          children: [
            SizedBox(height: Get.height*0.1,),
            Text('Set up your profile!',
            style: GoogleFonts.manrope( 
              fontWeight: FontWeight.w600,
              fontSize: 24,
              color: Colors.white
            ),
            )
          ],
        ),
      ),
    );
  }
}