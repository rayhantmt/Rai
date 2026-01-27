import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rai/common_widgets/more_section_widget.dart';
import 'package:rai/modules/community_details/community_details_controller.dart';
import 'package:rai/utils/app_images.dart';

class CommunityDetailsView extends GetView<CommunityDetailsController> {
  const CommunityDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final arg = Get.arguments;
    final String name = arg['name'];
    final String img = arg['img'];
    final String member = arg['member'];
    return Scaffold(
      backgroundColor: AppImages.primarycolor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Get.height * 0.06),
              GestureDetector(
                onTap: () => Get.back(),
                child: Image.asset(
                  AppImages.commentconcernbackicon,
                  height: Get.height * 0.06,
                ),
              ),
              SizedBox(height: Get.height * 0.03),
              Container(
                height: Get.height * 0.23,
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Color(0xff393A40)),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(img),
                        ),
                        SizedBox(width: Get.width * 0.03),
                        Column(
                          children: [
                            Text(
                              member,
                              style: GoogleFonts.manrope(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: Color(0xffEEEEF0),
                              ),
                            ),
                            Text(
                              'members',
                              style: GoogleFonts.manrope(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Color(0xffB2B3BD),
                              ),
                            ),
                          ],
                        ),
                        Image.asset(
                          AppImages.addPeopleIcon,
                          height: Get.height * 0.05,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color(0xffEEEEF0),
                          ),
                        ),
                        Text(
                          'Smart bettors hang out here. Discuss picks, parlays, odds, and insights powered read more...',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Color(0xfffB2B3BD),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: Get.height * 0.02),
              MoreSectionWidget(
                tittle: 'Group Link',
                img: AppImages.shareGroupLink,
              ),
              SizedBox(height: Get.height * 0.03),
              MoreSectionWidget(
                tittle: 'Group member',
                img: AppImages.groupMemberIcon,
              ),
              SizedBox(height: Get.height * 0.03),
              Row(
                children: [
                  Image.asset(
                    AppImages.notificationIcon,
                    height: Get.height * 0.05,
                  ),
                  SizedBox(width: Get.width * 0.04),
                  Text(
                    'Mute Notifications',
                    style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Color(0xffEEEEF0),
                    ),
                  ),
                  SizedBox(width: Get.width * 0.2),
                 Obx(() =>  Switch(
                    activeTrackColor: Color(0xffEEEEF0),

                    activeColor: Color(0xff19191B),
                    value: controller.notificatio.value,
                    onChanged: (value) => controller.notificatio(value),
                  ),)
                ],
              ),
              SizedBox(height: Get.height*0.28,),
              Container(
                height: Get.height*0.06,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xff222325),
                  borderRadius: BorderRadius.circular(16)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppImages.leaveicon,
                    height: Get.height*0.03,
                    ),
                    Text('Leave',
                    style: GoogleFonts.manrope( 
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Color(0xffEF4444)
                    ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
