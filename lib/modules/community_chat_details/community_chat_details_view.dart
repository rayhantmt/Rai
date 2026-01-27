import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rai/modules/community_chat_details/community_chat_details_controller.dart';
import 'package:rai/utils/app_images.dart';
import 'package:rai/utils/app_pages.dart';

class CommunityChatDetailsView extends GetView<CommunityChatDetailsController> {
  const CommunityChatDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final arg = Get.arguments;
    final String name = arg['name'];
    final String img = arg['img'];
    final String member = arg['member'];
    return Scaffold(
      backgroundColor: AppImages.primarycolor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: Get.height * 0.06),
            Row(
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Image.asset(
                    AppImages.commentconcernbackicon,
                    height: Get.height * 0.06,
                  ),
                ),
                SizedBox(width: Get.width * 0.02),
                GestureDetector(
                  onTap: () => Get.toNamed(AppPages.communityDetails,arguments: {
                    'img':img,
                    'name':name,
                    'member':member,
                  }),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(img),
                      ),
                      SizedBox(width: Get.width * 0.04),
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
                            member,
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
              ],
            ),
            SizedBox(height: Get.height*0.76,),
               Row(
              children: [
                Image.asset(AppImages.imagepicking, height: Get.height * 0.07),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Color(0xff222325),
                  ),
                  height: Get.height * 0.07,
                  width: Get.width * 0.745,
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: TextFormField(
                          cursorColor: Colors.white,
                          style: TextStyle(color: Colors.white),
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
                      Image.asset(AppImages.sendbutton,
                      height: Get.height*0.05,
                      ),
                      Image.asset(AppImages.micIcon,
                      height: Get.height*0.05,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
