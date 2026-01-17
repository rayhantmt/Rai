import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rai/modules/account_settings/account_settings_controller.dart';
import 'package:rai/utils/app_images.dart';

class AccountSettingsView extends GetView<AccountSettingsController> {
  const AccountSettingsView({super.key});

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
                  Text('Account Setting',
                  style: GoogleFonts.manrope( 
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                    color: Color(0xffEEEEF0)
                  ),
                  )
                ],
              ),
              SizedBox(height: Get.height*0.03,),
            Obx(()=>
              Row(
                children: [
                  GestureDetector(
                    onTap: () => controller.toggleScreen(0),
                    child: Text('Personal Info',
                    style: GoogleFonts.manrope( 
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: controller.screetype.value==0?Color(0xffEEEEF0):Color(0xff6C6E79)
                    ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => controller.toggleScreen(1),
                    child: Text('Change Password',
                    style: GoogleFonts.manrope( 
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: controller.screetype.value==1?Color(0xffEEEEF0):Color(0xff6C6E79)
                    ),
                    ),
                  )
                ],
              )
            )
            ],
          ),
        ),
      ),
    );
  }
}