import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rai/utils/app_images.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AppImages.logo, height: Get.height * 0.05),
                Image.asset(
                  AppImages.notificationicon,
                  height: Get.height * 0.06,
                ),
              ],
            ),
            SizedBox(height: Get.height * 0.02),
            Row(
              children: [
                ClipRRect(
                  // borderRadius: BorderRadiusGeometry.circular(9),
                  child: Image.asset(
                    AppImages.imagepicking,
                    height: Get.height * 0.1,
                    width: Get.width * 0.2,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'Ethen Walker',
                      style: GoogleFonts.manrope(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Color(0xffEEEEF0),
                      ),
                    ),
                    Text(
                      '@random_234',
                      style: GoogleFonts.manrope(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Color(0xffB2B3BD),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: Get.height * 0.02),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color(0xff222325),
              ),
              height: Get.height * 0.17,
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        AppImages.premiumicon,
                        height: Get.height * 0.1,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Free Plan',
                            style: GoogleFonts.manrope(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: Color(0xffEEEEF0),
                            ),
                          ),
                          Text(
                            "Currently you're using",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Color(0xffB2B3BD),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: Get.height * 0.05,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Color(0xff303136),
                      ),
                      child: Center(
                        child: Text(
                          'Purchase rai.pro >',
                          style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Get.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(AppImages.warningicon, height: Get.height * 0.05),
                Expanded(
                  child: Text(
                    'rai. is not responsible for your losses\nOnly for your wins',
                    //overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color(0xffEEEEF0),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: Get.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(AppImages.warningicon, height: Get.height * 0.05),
                Expanded(
                  child: Text(
                    'No pick is a 100% lock. \nIf it was we would be on a yacht somewhere',
                    //overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color(0xffEEEEF0),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: Get.height*0.02,),
            Image.asset(AppImages.launchBannar)
          ],
        ),
      ),
    );
  }
}
