import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rai/modules/community_chat_details/community_chat_details_controller.dart';
import 'package:rai/utils/app_images.dart';

class CommunityChatDetailsView extends GetView<CommunityChatDetailsController> {
  const CommunityChatDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final arg = Get.arguments;
    final String name = arg['name'];
    final String img = arg['img'];
    final String member=arg['member'];
    return Scaffold(
      backgroundColor: AppImages.primarycolor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: Get.height * 0.06),
            Row(
              children: [
                Image.asset(
                  AppImages.commentconcernbackicon,
                  height: Get.height * 0.06,
                ),
                SizedBox(width: Get.width*0.02,),
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(img)),
                  SizedBox(width: Get.width*0.04,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                    style: GoogleFonts.manrope( 
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Color(0xffEEEEF0)
                    ),
                    ),
                    Text(member,
                    style: GoogleFonts.manrope( 
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color(0xffEEEEF0)
                    ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
