import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rai/utils/app_images.dart';

class AdmincommunityGetRequestsView extends StatelessWidget {
  const AdmincommunityGetRequestsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppImages.primarycolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Get.height*0.06,),
            Row(
              children: [
                Image.asset(AppImages.commentconcernbackicon,height: Get.height*0.5,),
                Text('Member List',
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                  color: Color(0xffEEEEF0)
                ),
                ),
              ],
            )
          ],
        ),
      ),
    );

  }
}