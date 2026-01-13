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
            crossAxisAlignment: CrossAxisAlignment.start,
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
              SizedBox(height: Get.height * 0.02),
              Container(
                height: Get.height * 0.08,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Color(0xff222325),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(AppImages.profileimg),
                    ),
                    SizedBox(width: Get.width*0.05,),
                    Column(
                      children: [
                        Text('Adam smith',
                        style: GoogleFonts.manrope( 
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Color(0xffEEEEF0)
                        ),
                        ),
                        Text('new@123',
                        style: GoogleFonts.manrope( 
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Color(0xffB2B3BD)
                        ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
