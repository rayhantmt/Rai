import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rai/modules/community/community_controller.dart';
import 'package:rai/utils/app_images.dart';
import 'package:rai/utils/app_pages.dart';
class CommunityView extends GetView<CommunityController> {
  const CommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppImages.primarycolor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            // physics: NeverScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: Get.height * 0.07),
                  Text(
                    'Community',
                    style: GoogleFonts.manrope(
                      color: Color(0xffEEEEF0),
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(height: Get.height * 0.03),
                  Text(
                    'Your groups',
                    style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Color(0xffB2B3BD),
                    ),
                  ),
                  //SizedBox(height: Get.height * 0.02),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.communities.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: GestureDetector(
                        onTap: () => Get.toNamed(AppPages.communitydetails,arguments: {
                          'name':controller.communities[index].tittle,
                          'img':controller.communities[index].members
                        }),
                        child: Container(
                          height: Get.height * 0.066,
                          width: double.infinity,
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                  controller.communities[index].img,
                                ),
                                radius: 40,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.communities[index].tittle,
                                    style: GoogleFonts.manrope(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: Color(0xffEEEEF0),
                                    ),
                                  ),
                                  Text(
                                    '${controller.communities[index].members} members',
                        
                                    style: GoogleFonts.manrope(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: Color(0xffEEEEF0),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: Get.height * 0.15,
            right: 20,
            child: GestureDetector(
              onTap: () => Get.toNamed(AppPages.createNewGroup),
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Color(0xff303136),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.add, color: Color(0xffEEEEF0), size: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
