import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rai/utils/app_images.dart';

class CommunityView extends GetView {
  const CommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppImages.primarycolor,
      floatingActionButton: Icon(Icons.add, color: Colors.white),
      body: Stack(
        children: [
          Positioned(
            bottom: Get.height * 0.2,
            right: Get.width * 0.1,
            child: Icon(Icons.add, color: Colors.white),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: Get.height*0.07,),
                  Text('Community', style: GoogleFonts.manrope(color: Color(0xffEEEEF0),
                  fontWeight: FontWeight.w700,
                  fontSize: 22
                  
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
