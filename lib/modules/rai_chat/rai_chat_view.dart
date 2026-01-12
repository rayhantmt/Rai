import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rai/utils/app_images.dart';

class RaiChatView extends StatelessWidget {
  const RaiChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppImages.primarycolor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: Get.height * 0.05),
            Row(
              children: [
                Image.asset(
                  AppImages.logo,
                  height: Get.height * 0.05,
                  width: Get.width * 0.2,
                ),
                Expanded(child: SizedBox()),
                Icon(
                  Icons.history,
                  size: Get.height * 0.04,
                  color: Color(0xffEEEEF0),
                ),
                Icon(
                  Icons.more_vert,
                  size: Get.height * 0.04,
                  color: Color(0xffEEEEF0),
                ),
              ],
            ),
            SizedBox(height: Get.height * 0.02),
            SizedBox(
              height: Get.height * 0.7,
              child: Container(color: AppImages.primarycolor,
              
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.chatscreenblacklogo,
                  height: Get.height*0.05,
                  ),
                  Text('Hi, Ethen!',
                  style: GoogleFonts.manrope( 
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Color(0xffEEEEF0)
                  ),
                  ),
                  Text("'Just ask me, what's on your mind?",
                  style: GoogleFonts.manrope( 
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Color(0xffB2B3BD)
                  ),
                  )
                ],
              ),
              ),
            ),
            Row(
              children: [
                Image.asset(AppImages.imagepicking, height: Get.height * 0.07),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Color(0xff222325),
                  ),
                  height: Get.height * 0.07,
                  width: Get.width * 0.75,
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: TextFormField(
                          cursorColor: Colors.white,

                          decoration: InputDecoration(
                            hint: Center(
                              child: Text(
                                'Type message here...',
                                style: GoogleFonts.manrope(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Color(0xffB2B3BD),
                                ),
                              ),
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Image.asset(AppImages.sendbutton),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
