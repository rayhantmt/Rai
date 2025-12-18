import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rai/common_widgets/common_textfield.dart';
import 'package:rai/modules/log_in/log_in_controller.dart';
import 'package:rai/utils/app_images.dart';

class LogInView extends GetView<LogInController> {
  const LogInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff19191B),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Get.height * 0.1),
              Image.asset(
                AppImages.logo,
                height: Get.height * 0.1,
                width: Get.width * 0.3,
              ),
              SizedBox(height: Get.height * 0.01),
              Text(
                'Welcome Back!',
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              Text(
                'Please sign in with your registered email or phone number and password ',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color(0xffB2B3BD),
                ),
              ),
              SizedBox(height: Get.height * 0.05),
              Commontextfield(
                tittle: 'Username or Email/phone number',
                hint: 'Enter username or email/phone number',
                obsecuretext: false,
              ),
              SizedBox(height: Get.height * 0.01),
              Obx(
                () => Commontextfield(
                  tittle: 'Password',
                  hint: 'Enter password',
                  obsecuretext: controller.pass.value,
                  suffix: GestureDetector(
                    onTap: () => controller.togglepass(),
                    child: controller.pass.value
                        ? Icon(Icons.visibility, color: Color(0xff797B86))
                        : Icon(Icons.visibility_off, color: Color(0xff797B86)),
                  ),
                ),
              ),
              SizedBox(height: Get.height * 0.01),
              Row(
                children: [
                  Obx(
                    () => Checkbox(
                      checkColor: Colors.black,
                      activeColor: Colors.white,
                      value: controller.ischeck.value,
                      onChanged: (value) => controller.togglechekc(value),
                    ),
                  ),
                  Text('Rememeber me',
                  style: GoogleFonts.inter( 
                    color: Color(0xffEEEEF0)
                  ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
