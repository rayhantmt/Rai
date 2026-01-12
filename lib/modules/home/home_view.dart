import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rai/utils/app_images.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppImages.primarycolor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: Get.height*0.05,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AppImages.logo,
                height: Get.height*0.05,
                ),
                Image.asset(AppImages.notificationicon,
                height: Get.height*0.06,
                )
              ],
            ),
            SizedBox(height: Get.height*0.02,),
            Row(
              children: [
                ClipRRect(
                  // borderRadius: BorderRadiusGeometry.circular(9),
                  child: Image.asset(AppImages.imagepicking,
                  height: Get.height*0.1,
                  width: Get.width*0.2,
                  ),
                ),
                Column(
                  children: [
                    Text('Ethen Walker',
                    style: GoogleFonts.manrope( 
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Color(0xffEEEEF0)
                    ),
                    ),
                    Text('@random_234',
                    style: GoogleFonts.manrope( 
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color(0xffB2B3BD)
                    ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}