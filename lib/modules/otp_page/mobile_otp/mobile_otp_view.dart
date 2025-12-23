import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rai/common_widgets/common_button.dart';
import 'package:rai/modules/otp_page/mobile_otp/mobile_otp_controller.dart';
import 'package:rai/utils/app_images.dart';
import 'package:rai/utils/app_pages.dart';

class MobileOtpView extends GetView<MobileOtpController> {
  const MobileOtpView({super.key});

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
              SizedBox(
                height: Get.height*0.2,
        
              ),
              Text('Verify Your Identity',
              style: GoogleFonts.manrope( 
                fontWeight: FontWeight.w600,
                fontSize: 24,
                color: Colors.white
              ),
              ),
              SizedBox(height: Get.height*0.02,),
              Text('Enter the code sent to your email alex.647@gmail.com',
              style: GoogleFonts.manrope( 
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.white
              ),
              ),
              SizedBox(height: Get.height*0.1,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(6, (index) {
                    return SizedBox(
                      width: 40,
                      child: TextField(
                        controller: controller.otpControllers[index],
                        focusNode: controller.otpFocusNodes[index],
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                        decoration: const InputDecoration(
                          counterText: '',
                          border: UnderlineInputBorder(),
                        ),
                        onChanged: (value) {
                          controller.onOtpFieldChanged(value, index);
                        },
                      ),
                    );
                  }),
                ),
              SizedBox(height: Get.height*0.025,),
                GestureDetector(
                  onTap: () => Get.toNamed(AppPages.usercredentials),
                  child: CommonButton(tittle: 'Verify')),
                SizedBox(height: Get.height*0.02,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Didn't get OTP?",
                    style: GoogleFonts.manrope( 
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color(0xffB2B3BD)
                    ),
                    ),
                    Obx(
                      () => GestureDetector(
                        onTap: controller.secondsRemaining.value == 0
                            ? controller.resendCode
                            : null,
                        child: Text(
                          controller.secondsRemaining.value == 0
                              ? "Resend code"
                              : "Resend code ${controller.secondsRemaining}s",
                          style: TextStyle(
                            color: controller.secondsRemaining.value == 0
                                ? Colors.white
                                : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
             ],
          ),
        ),
      ),
    );
  }
}