import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rai/utils/app_images.dart';

class RaisPicksView extends StatelessWidget {
  const RaisPicksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppImages.primarycolor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: Get.height*0.06,),
              Text("rai's Picks",
              style: GoogleFonts.manrope( 
                fontWeight: FontWeight.w700,
                fontSize: 22,
                color: Color(0xffEEEEF0)
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}