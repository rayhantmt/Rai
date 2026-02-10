import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rai/modules/group_member_community/group_member_community_controller.dart';
import 'package:rai/utils/app_images.dart';

class GroupMemberCommunityView extends GetView<GroupMemberCommunityController> {
  const GroupMemberCommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppImages.primarycolor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                SizedBox(width: Get.width * 0.05),
                Text(
                  'Member List',
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                    color: Color(0xffEEEEF0),
                  ),
                ),
                Expanded(child: SizedBox()),
                Image.asset(AppImages.peopleicon, height: Get.height * 0.04),
              ],
            ),
            SizedBox(height: Get.height * 0.02),
            Container(
              padding: EdgeInsets.only(left: 10),
              height: Get.height * 0.05,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xff000000).withOpacity(0.8),
                borderRadius: BorderRadius.circular(100),
              ),
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hint: Row(
                    children: [
                      Icon(Icons.search, color: Color(0xff6E6E6E)),
                      Text(
                        'Search member',
                        style: TextStyle(color: Color(0xff6E6E6E)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.02),
            Row(
              children: [
                Text(
                  'Approval required to join',
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Color(0xffEEEEF0),
                  ),
                ),
                SizedBox(width: Get.width * 0.2),
                Obx(
                  () => Switch(
                    activeTrackColor: Color(0xffEEEEF0),

                    activeColor: Color(0xff19191B),
                    value: controller.notificatio.value,
                    onChanged: (value) => controller.notificatio(value),
                  ),
                ),
              ],
            ),
            SizedBox(height: Get.height*0.02,),
            Row(
              children: [
                Container(
                  height: Get.height*0.05,
                  width: Get.width*0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Text('General',
                    style:GoogleFonts.manrope( 
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Color(0xff19191B)
                    ) ,
                    ),
                  ),
                ),
                SizedBox(width: Get.width*0.05,),
                  Container(
              height: Get.height*0.05,
              width: Get.width*0.35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.white,
              ),
              child: Center(
                child: Text('Join requests',
                style:GoogleFonts.manrope( 
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: Color(0xff19191B)
                ) ,
                ),
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
