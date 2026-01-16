import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rai/utils/app_images.dart';

class CommentConcernView extends StatelessWidget {
  const CommentConcernView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppImages.primarycolor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: Get.height*0.07,
              ),
              Row(
                children: [
                  Image.asset(AppImages.commentconcernbackicon,
                  height: Get.height*0.05,
                  
                  ),

                  SizedBox(width: Get.width*0.05,),
                  Text('Comment & Concern',
                  style: GoogleFonts.manrope( 
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                    color: Color(0xffEEEEF0)
                  ),
                  )
                ],
              ),
              Center(
                child: Text('No comment & concern found',
                style: GoogleFonts.manrope( 
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color(0xffB2B3BD)
                ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}