import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rai/common_widgets/common_button.dart';
import 'package:rai/common_widgets/date_picking_field.dart';
import 'package:rai/modules/set_profile/set_up_profile_controller.dart';
import 'package:rai/utils/app_images.dart';

class SetProfileView extends GetView<SetUpProfileController> {
  const SetProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppImages.primarycolor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Get.height * 0.1),
              Text(
                'Set up your profile!',
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: Get.height * 0.02),
              Text(
                'Set your photo and  add details to get started',
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color(0xffB2B3BD),
                ),
              ),
              SizedBox(height: Get.height * 0.03),
              Row(
                children: [
                  Container(
                    height: Get.height * 0.15,
                    width: Get.width * 0.3,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffB2B3BD),
                    ),
                    child: Obx(() {
                      // 1. Check if the value itself is null first
                      final file = controller.profileImage.value;

                      if (file != null && file.path.isNotEmpty) {
                        return ClipOval(
                          child: Image.file(File(file.path), fit: BoxFit.cover),
                        );
                      } else {
                        return const Center(
                          child: Text(
                            'Select image',
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      }
                    }),
                  ),
                  SizedBox(width: Get.width * 0.09),
                  Column(
                    children: [
                      Text(
                        'Must be JPG, JPEG or PNG',
                        style: GoogleFonts.manrope(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Color(0xffB2B3BD),
                        ),
                      ),
                      Text(
                        '64×64 px, under 2 MB',
                        style: GoogleFonts.manrope(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Color(0xffB2B3BD),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => controller.pickProfileImage(),
                        child: Text(
                          'Upload Photo',
                          style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: Get.height * 0.02),
              Divider(
                thickness: 1,
                indent: 1,
                endIndent: 1,
                color: Color(0xff5F606A),
              ),
              SizedBox(height: Get.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'First Name',
                        style: GoogleFonts.manrope(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: Get.height * 0.01),
                      Container(
                        height: Get.height * 0.06,
                        width: Get.width * 0.4,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff393A40)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextFormField(
                          controller: controller.firstnamecontroller,
                          style: TextStyle(
                            color: Colors.white
                          ),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10),
                            hint: Text(
                              'Write fist name',
                              style: GoogleFonts.manrope(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Color(0xff797B86),
                              ),
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Last Name',
                        style: GoogleFonts.manrope(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: Get.height * 0.01),
                      Container(
                        height: Get.height * 0.06,
                        width: Get.width * 0.4,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff393A40)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextFormField(
                          controller: controller.lastnamecontroller,
                          style: TextStyle(
                            color: Colors.white
                          ),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10),
                            hint: Text(
                              'Write last name',
                              style: GoogleFonts.manrope(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Color(0xff797B86),
                              ),
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: Get.height * 0.02),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bio',
                    style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0xffEEEEF0),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.02),
                  Container(
                    height: Get.height * 0.15,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff393A40)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextFormField(
                      controller: controller.boicontroller,
                      style: TextStyle(
                        color: Colors.white
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        border: InputBorder.none,
                        hint: Text(
                          'Write you short bio here.....',
                          style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Color(0xff6C6E79),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: Get.height * 0.02),
              DatePickerField(
                tittle: 'Date of birth',
                hint: 'Select date of birth',
                textcontroller: controller.birthdatecontroller,
              ),
              SizedBox(height: Get.height * 0.02),
              GestureDetector(
                //onTap: () => print(controller.birthdatecontroller.text),
                onTap: () => controller.createUser(),
                child: Obx(() => controller.isLoading.value?Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ):CommonButton(tittle: 'Get Started'),)
              ),
            ],
          ),
        ),
      ),
    );
  }
}
