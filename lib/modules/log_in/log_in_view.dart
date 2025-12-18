import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rai/common_widgets/common_textfield.dart';
import 'package:rai/utils/app_images.dart';

class LogInView extends StatelessWidget {
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
              SizedBox(height: Get.height*0.01,),
              Text('Welcome Back!',
              style: GoogleFonts.inter( 
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 20
              )
              ),
              Commontextfield(
                tittle: 'Username or Email/phone number',
                hint: 'Enter username or email/phone number',
                obsecuretext: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
