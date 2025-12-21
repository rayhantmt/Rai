import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rai/utils/app_pages.dart';

class Firstpage extends StatelessWidget {
  const Firstpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff19191B),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Get.height * 0.15),
            Text(
              'Are You 18 or Older?',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            SizedBox(height: Get.height * 0.02),
            Text(
              'This app is only available to users 18 years or older.',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Color(0xffB2B3BD),
              ),
            ),
            Expanded(child: SizedBox()),
            GestureDetector(
              onTap: () => Get.toNamed(AppPages.secondpage),
              child: Container(
                height: Get.height * 0.06,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xff303136),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: Text(
                    'Yes',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.02),
            Container(
              height: Get.height * 0.06,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xff303136),
                ),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Text(
                  'No',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.08),
          ],
        ),
      ),
    );
  }
}
