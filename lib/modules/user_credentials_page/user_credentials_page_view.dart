import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rai/common_widgets/common_textfield.dart';
import 'package:rai/modules/user_credentials_page/user_credentials_page_controller.dart';
import 'package:rai/utils/app_images.dart';

class UserCredentialsPageView extends GetView<UserCredentialsPageController> {
  const UserCredentialsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppImages.primarycolor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Get.height*0.1,),
              Text('User Credential!',
              style: GoogleFonts.manrope( 
                fontWeight: FontWeight.w600,
                fontSize: 24,
                color: Colors.white
              ),
              ),
              SizedBox(height: Get.height*0.02,),
              Text('Set an username &  strong password to secure account',
              style: GoogleFonts.manrope( 
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Color(0xffB2B3BD)
              ),
              ),
              SizedBox(height: Get.height*0.03,),
              Commontextfield(tittle: 'Username', hint: 'Enter unique name', obsecuretext: false),
              SizedBox(height: Get.height*0.02,),
              Obx(() => Commontextfield(tittle: 'Password', hint: 'Enter a strong pawword', obsecuretext: controller.isobsecured.value,
              suffix: GestureDetector(
                onTap: () => controller.toggle1(),
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Icon(controller.isobsecured.value?Icons.visibility:Icons.visibility_off,color: Color(0xff5F606A),),
                ),
              ),
              ),)

            ],
          ),
        ),
      ),
    );
  }
}