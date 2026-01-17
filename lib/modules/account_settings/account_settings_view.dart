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
                  SizedBox(width: Get.width*0.05,),
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
            ),
            SizedBox(
              height: Get.height*0.05,
            ),
            Obx(()=>
          Container(child: 
            controller.screetype.value==0? _PersonalInfo():_ChangePassword()
            )
          )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _PersonalInfo (){
  return Column(
    
    children: [
     Container(
      height: Get.height*0.5,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 1,
          color: Color(0xff393A40)
        )
      ),
      child: Padding(
        padding: const EdgeInsets.all( 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: Get.height*0.06,
              backgroundImage: AssetImage(AppImages.profileimg),
            ),
            SizedBox(height: Get.height*0.02),
            Divider(
             height: 1,
             indent: 1,
             endIndent: 1,
             color: Color(0xff393A40),
            ),
            Text('Username',
            style: GoogleFonts.manrope( 
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color(0xffEEEEF0)
            ),
            ),
            Text('new_@123',
            style: GoogleFonts.manrope( 
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color(0xffB2B3BD)
            ),
            ),
            SizedBox(height: Get.height*0.02,),
            Text('Name',
            style: GoogleFonts.manrope( 
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color(0xffEEEEF0)
            ),
            ),
            Text('Adam Smith',
            style: GoogleFonts.manrope( 
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color(0xffB2B3BD)
            ),
            ),
            SizedBox(height: Get.height*0.02,),
            Text('Bio'),
            
          ],
        ),
      ),
     )
     
    ],
  );
}

Widget _ChangePassword(){
  return Column(
    children: [
      Text('Change Password',
      style: TextStyle(
        color: Colors.white
      ),
      )
    ],
  );
}