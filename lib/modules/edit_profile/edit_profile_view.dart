import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rai/utils/app_images.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppImages.primarycolor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: Get.height*0.07,),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Image.asset(AppImages.commentconcernbackicon,
                    height: Get.height*0.05,
                    ),
                  ),
                  SizedBox(width: Get.width*0.05,),
                  Text('Edit Profile',
                  style: GoogleFonts.manrope( 
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                    color: Color(0xffEEEEF0)
                  ),
                  )
                ],
              ),
              SizedBox(height: Get.height*0.02,),
              Container(
                height: Get.height*0.15,
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(AppImages.profileimg,
                      
                      ),
                      radius: Get.height*0.07,
                    ),
                    Column(
                      children: [
                        Text('Must be JPG,JPEG or PNG',
                        style: GoogleFonts.manrope( 
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Color(0xffB2B3BD)
                        ),
                        ),
                          Text('64×64 px, under 2 MB',
                        style: GoogleFonts.manrope( 
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Color(0xffB2B3BD)
                        ),
                        ),
                        Spacer(),
                        Text('UPload Image',
                        style: GoogleFonts.manrope( 
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Color(0xffEEEEF0)
                        ),
                        ),
                        SizedBox(
                          height: Get.height*0.02,
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}