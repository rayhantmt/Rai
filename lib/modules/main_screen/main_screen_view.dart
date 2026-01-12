import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rai/modules/community/community_view.dart';
import 'package:rai/modules/home/home_view.dart';
import 'package:rai/modules/main_screen/main_screen_controller.dart';
import 'package:rai/modules/more_section/more_section_view.dart';
import 'package:rai/modules/rai_chat/rai_chat_view.dart';
import 'package:rai/modules/rais_picks/rais_picks_view.dart';
import 'package:rai/utils/app_images.dart';

class MainScreenView extends GetView<MainScreenController> {
  const MainScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        
        children: [
          Obx(
           (){
            if(controller.pagetype.value ==0)
            {
              return CommunityView();
            }
            else if (controller.pagetype.value==1) {
              return RaiChatView();
            }
           else if(controller.pagetype.value==2){
            return HomeView();
           }
           else if(controller.pagetype.value==3){
            return RaisPicksView();
           }
           else {
            return MoreSectionView();
           }
           }
            
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Obx(
              () => Container(
                decoration: BoxDecoration(
                  color: Color(0xff19191B),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                  border: Border.all(width: 0.5, color: Color(0xff6C6E79)),
                ),
                height: Get.height * 0.1,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () => controller.setpagetype(0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppImages.communityicon,
                            height: Get.height * 0.035,
                            color: controller.pagetype.value == 0
                                ? Color(0xffEEEEF0)
                                : Color(0xff6C6E79),
                          ),
                          Text('Community',
                          style: GoogleFonts.manrope(
                              fontWeight: FontWeight.w500,
                              color: controller.pagetype.value == 0
                                  ? Color(0xffEEEEF0)
                                  : Color(0xff6C6E79),
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => controller.setpagetype(1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppImages.aiicon,
                       
                            height: Get.height * 0.035,
                            color: controller.pagetype.value == 1
                                ? Color(0xffEEEEF0)
                                : Color(0xff6C6E79),
                          ),
                          Text('rai. Chat',
                          style: GoogleFonts.manrope(
                              fontWeight: FontWeight.w500,
                              color: controller.pagetype.value == 1
                                  ? Color(0xffEEEEF0)
                                  : Color(0xff6C6E79),
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => controller.setpagetype(2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppImages.homeicon,
                            height: Get.height * 0.035,
                            color: controller.pagetype.value == 2
                                ? Color(0xffEEEEF0)
                                : Color(0xff6C6E79),
                          ),
                          Text('Home',
                          style: GoogleFonts.manrope(
                              fontWeight: FontWeight.w500,
                              color: controller.pagetype.value == 2
                                  ? Color(0xffEEEEF0)
                                  : Color(0xff6C6E79),
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => controller.setpagetype(3),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppImages.picksicon,
                            height: Get.height * 0.035,
                            color: controller.pagetype.value == 3
                                ? Color(0xffEEEEF0)
                                : Color(0xff6C6E79),
                          ),
                          Text("rai's picks",
                          style: GoogleFonts.manrope(
                              fontWeight: FontWeight.w500,
                              color: controller.pagetype.value == 3
                                  ? Color(0xffEEEEF0)
                                  : Color(0xff6C6E79),
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => controller.setpagetype(4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppImages.moreicon,
                            height: Get.height * 0.035,
                            color: controller.pagetype.value == 4
                                ? Color(0xffEEEEF0)
                                : Color(0xff6C6E79),
                          ),
                          Text(
                            'More',
                            style: GoogleFonts.manrope(
                              fontWeight: FontWeight.w500,
                              color: controller.pagetype.value == 4
                                  ? Color(0xffEEEEF0)
                                  : Color(0xff6C6E79),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
