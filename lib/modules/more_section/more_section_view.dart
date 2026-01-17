import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rai/common_widgets/more_section_widget.dart';
import 'package:rai/utils/app_images.dart';
import 'package:rai/utils/app_pages.dart';

class MoreSectionView extends StatelessWidget {
  const MoreSectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppImages.primarycolor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Get.height * 0.07),

              Text(
                'More Tools',
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                  color: Color(0xffEEEEF0),
                ),
              ),
              SizedBox(height: Get.height * 0.02),
              Container(
                //height: Get.height * 0.08,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Color(0xff222325),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(AppImages.profileimg),
                    ),
                    SizedBox(width: Get.width * 0.05),
                    Column(
                      children: [
                        Text(
                          'Adam smith',
                          style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Color(0xffEEEEF0),
                          ),
                        ),
                        Text(
                          'new@123',
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
              ),
              SizedBox(height: Get.height * 0.02),
              Text(
                'More Tools',
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Color(0xffB2B3BD),
                ),
              ),
              SizedBox(height: Get.height * 0.02),
              Container(
                // height: Get.height * 0.31,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Color(0xff222325),
                ),
                child: Column(
                  children: [
                    SizedBox(height: Get.height * 0.01),
                    MoreSectionWidget(
                      tittle: 'Live Bet Tracking',
                      img: AppImages.livebettracking,
                    ),
                    SizedBox(height: Get.height * 0.01),
                    Divider(height: 1, color: Color(0xffB2B3BD)),
                    SizedBox(height: Get.height * 0.01),
                    MoreSectionWidget(
                      tittle: 'Subscription',
                      img: AppImages.moresubscription,
                    ),
                    SizedBox(height: Get.height * 0.01),
                    Divider(height: 1, color: Color(0xffB2B3BD)),
                    SizedBox(height: Get.height * 0.01),
                    MoreSectionWidget(
                      tittle: 'Payment & Billing',
                      img: AppImages.morepaymentbilling,
                    ),
                    SizedBox(height: Get.height * 0.01),
                    Divider(height: 1, color: Color(0xffB2B3BD)),
                    SizedBox(height: Get.height * 0.01),
                    GestureDetector(
                      onTap: () => Get.toNamed(AppPages.commentandconcern),
                      child: MoreSectionWidget(
                        tittle: 'Comment & Concern',
                        img: AppImages.morecommentconcern,
                      ),
                    ),
                    SizedBox(height: Get.height * 0.01),
                    Divider(height: 1, color: Color(0xffB2B3BD)),
                    SizedBox(height: Get.height * 0.01),
                    GestureDetector(
                      onTap: () => Get.toNamed(AppPages.accountsetting),
                      child: MoreSectionWidget(
                        tittle: 'Account Setting',
                        img: AppImages.accountsettings,
                      ),
                    ),
                    SizedBox(height: Get.height * 0.01),
                  ],
                ),
              ),
              SizedBox(height: Get.height * 0.02),
              Text(
                'More Info & Support',
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Color(0xffB2B3BD),
                ),
              ),
              SizedBox(height: Get.height * 0.02),
              Container(
                // height: Get.height * 0.11,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Color(0xff222325),
                ),
                child: Column(
                  children: [
                    MoreSectionWidget(
                      tittle: 'About Us',
                      img: AppImages.aboutUsMore,
                    ),
                    SizedBox(height: Get.height * 0.01),
                    Divider(height: 1, color: Color(0xffB2B3BD)),
                    SizedBox(height: Get.height * 0.01),
                    MoreSectionWidget(
                      tittle: 'Rate this App',
                      img: AppImages.ratetheapp,
                    ),
                  ],
                ),
              ),
              SizedBox(height: Get.height * 0.02),
              Text(
                'Others',
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Color(0xffB2B3BD),
                ),
              ),
              SizedBox(height: Get.height * 0.02),
              Container(
                //height: Get.height * 0.11,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Color(0xff222325),
                ),
                child: Column(
                  children: [
                    MoreSectionWidget(
                      tittle: 'About Us',
                      img: AppImages.aboutUsMore,
                    ),
                    SizedBox(height: Get.height * 0.01),
                    Divider(height: 1, color: Color(0xffB2B3BD)),
                    SizedBox(height: Get.height * 0.01),
                    MoreSectionWidget(
                      tittle: 'Rate this App',
                      img: AppImages.ratetheapp,
                    ),
                  ],
                ),
              ),
              SizedBox(height: Get.height * 0.02),
              Container(
                height: Get.height * 0.065,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xff222325),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      AppImages.logoutlogo,
                      height: Get.height * 0.04,
                    ),
                    Text(
                      'Sign Out',
                      style: GoogleFonts.manrope(
                        color: Color(0xffEF4444),
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Container(height: Get.height * 0.5),
            ],
          ),
        ),
      ),
    );
  }
}
