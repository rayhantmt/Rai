import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rai/common_widgets/common_button.dart';
import 'package:rai/common_widgets/common_textfield.dart';
import 'package:rai/modules/sign_up/2nd_page/2nd_page_controller.dart';
import 'package:rai/utils/app_images.dart';
import 'package:rai/utils/app_pages.dart';

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
            SizedBox(height: Get.height * 0.02),
            Text(
              'To complete the sign up process please enter your valid email or phone number',
              style: GoogleFonts.manrope(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            SizedBox(height: Get.height * 0.03),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Obx(() => GestureDetector(
                    onTap: () => controller.setsignintype(0),
                    child: Column(
                      children: [
                        Text(
                          'Email',
                          style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: controller.signuptype.value == 0
                                ? Color(0xffEEEEF0)
                                : Color(0xff64748B),
                          ),
                        ),
                        Container(
                          // indent: 1,
                          // endIndent: 1,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ),),
                  SizedBox(width: Get.width * 0.1),
                 Obx(() =>  GestureDetector(
                    onTap: () => controller.setsignintype(1),
                    child: Column(
                      children: [
                         Text(
                          'Phone',
                          style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: controller.signuptype.value == 1
                                ? Color(0xffEEEEF0)
                                : Color(0xff64748B),
                          ),
                        ),
                        Container(
                          // indent: 1,
                          // endIndent: 1,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),),                ],
              ),
            ),
            Expanded(
              child: Obx(() {
                if (controller.signuptype.value == 0) {
                  return EmailSignup();
                }
                if (controller.signuptype.value == 1) {
                  return MobileSignup();
                }
                return SizedBox();
              }),
            ),
          ],
        ),
      ),
    );
  }
}

Widget EmailSignup() {
  return SingleChildScrollView(
    child: Column(
      children: [
        SizedBox(height: Get.height * 0.03),
        Commontextfield(
          tittle: 'Email',
          hint: 'Enter valid email address',
          obsecuretext: false,
        ),
        SizedBox(height: Get.height * 0.03),
        GestureDetector(
          onTap: () => Get.toNamed(AppPages.emailotp),
          child: CommonButton(tittle: 'Continue'),
        ),
        SizedBox(height: Get.height * 0.03),
        Row(
          children: [
            Expanded(
              child: Divider(
                thickness: 1,
                color: Color(0xfff5F606A),
                indent: 2,
                endIndent: 20,
              ),
            ),
            Text(
              'or',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Color(0xffB2B3BD),
              ),
            ),
            Expanded(
              child: Divider(
                thickness: 1,
                color: Color(0xfff5F606A),
                indent: 20,
                endIndent: 2,
              ),
            ),
          ],
        ),
        SizedBox(height: Get.height * 0.03),
        Image.asset(AppImages.google),
        SizedBox(height: Get.height * 0.22),
        Text(
          'Already have an account',
          style: GoogleFonts.manrope(
            color: Color(0xffB2B3BD),
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
        SizedBox(height: Get.height * 0.02),
        GestureDetector(
          onTap: () => Get.toNamed(AppPages.login),
          child: Text(
            "Sing In",
            style: GoogleFonts.manrope(
              fontWeight: FontWeight.w700,
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget MobileSignup() {
  return SingleChildScrollView(
    child: Column(
      children: [
        SizedBox(height: Get.height * 0.03),
        Commontextfield(
          tittle: 'Phone',
          hint: 'Enter valid phone number',
          obsecuretext: false,
        ),
        SizedBox(height: Get.height * 0.03),
        CommonButton(tittle: 'Continue'),
        SizedBox(height: Get.height * 0.03),
        Row(
          children: [
            Expanded(
              child: Divider(
                thickness: 1,
                color: Color(0xfff5F606A),
                indent: 2,
                endIndent: 20,
              ),
            ),
            Text(
              'or',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Color(0xffB2B3BD),
              ),
            ),
            Expanded(
              child: Divider(
                thickness: 1,
                color: Color(0xfff5F606A),
                indent: 20,
                endIndent: 2,
              ),
            ),
          ],
        ),
        SizedBox(height: Get.height * 0.03),
        Image.asset(AppImages.google),
        SizedBox(height: Get.height * 0.22),
        Text(
          'Already have an account',
          style: GoogleFonts.manrope(
            color: Color(0xffB2B3BD),
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
        SizedBox(height: Get.height * 0.02),
        GestureDetector(
          onTap: () => Get.toNamed(AppPages.login),
          child: Text(
            "Sing In",
            style: GoogleFonts.manrope(
              fontWeight: FontWeight.w700,
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ],
    ),
  );
}
