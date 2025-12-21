import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rai/modules/sign_up/2nd_page/2nd_page_controller.dart';
import 'package:rai/utils/app_images.dart';

class SecondPageView extends GetView<SecondPageController> {
  const SecondPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppImages.primarycolor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Get.height * 0.1),
            Text(
              'Create an account!',
              style: GoogleFonts.manrope(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
            SizedBox(height: Get.height*0.02,),
            Text('To complete the sign up process please enter your valid email or phone number',
            style: GoogleFonts.manrope( 
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Colors.white
            ),
            ),
            SizedBox(height: Get.height*0.03,),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => controller.setsignintype(0),
                    child: Column(
                      children: [
                        Text('Email',
                        style: GoogleFonts.manrope( 
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: controller.signuptype.value==0? Colors.white: Color(0xff64748B)
                        ),
                        ),
                        Divider(
                          thickness: 1,
                          indent: 1,
                          endIndent: 1,
                          color: Colors.blue,
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: Get.width*0.1,),
                  GestureDetector(
                    onTap: () => controller.setsignintype(1),
                    child: Column(
                      children: [
                        Text('Phone',
                        style: GoogleFonts.manrope( 
                          color: Colors.white
                        ),
                        ),
                         Divider(
                      thickness: 1,
                      indent: 1,
                      endIndent: 1,
                      color: Colors.white,
                    )
                      ],
                    ),
                  ),
                 
                ],
              ),
            ),
            Expanded(
              child: Obx(() {
              if(controller.signuptype.value==0){
                return EmailSignup();
              }
              if(controller.signuptype.value==1){
                return MobileSignup();
              }
              return
              SizedBox();
              })
            )
          ],
        ),
      ),
    );
  }
}
Widget EmailSignup (){
  return SingleChildScrollView(
    child: Text('Email',
    style: TextStyle(
      color: Colors.white
    ),
    ),
  );
}

Widget MobileSignup(){
  return SingleChildScrollView(
    child: Text('Mobile',
    style: TextStyle(
      color: Colors.white
    ),
    ),
  );
}
