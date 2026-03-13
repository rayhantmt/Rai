import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rai/common_widgets/common_button.dart';
import 'package:rai/common_widgets/common_textfield.dart';
import 'package:rai/modules/create_new_group/create_new_group_controller.dart';
import 'package:rai/utils/app_images.dart';

class CreateNewGroupView extends GetView<CreateNewGroupController> {
  const CreateNewGroupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppImages.primarycolor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: Get.height * 0.07),
              Row(
                children: [
                  GestureDetector(
                    onTap: Get.back,
                    child: Image.asset(
                      AppImages.commentconcernbackicon,
                      height: Get.height * 0.05,
                    ),
                  ),
                  SizedBox(width: Get.width * 0.03),
                  Text(
                    'Create New Group',
                    style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                      color: Color(0xffEEEEF0),
                    ),
                  ),
                ],
              ),
              SizedBox(height: Get.height * 0.04),
              Obx(
                () => CircleAvatar(
                  radius: 80,
                  backgroundColor: Color(0xffB2B3BD),
                  backgroundImage: controller.profileImage.value != null
                      ? FileImage(File(controller.profileImage.value!.path))
                      : null,
                  child: controller.profileImage.value == null
                      ? Icon(Icons.person, size: 60, color: Colors.white)
                      : null,
                ),
              ),
              SizedBox(height: Get.height * 0.03),
              GestureDetector(
                onTap: () => controller.pickProfileImage(),
                child: Text(
                  'Upload Group Photo',
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Color(0xffEEEEF0),
                  ),
                ),
              ),
              SizedBox(height: Get.height * 0.02),
              Divider(
                height: 1,
                endIndent: 1,
                indent: 1,
                color: Color(0xff393A40),
              ),
              Commontextfield(
                controller: controller.namecontroller,
                tittle: 'Group Name',
                hint: 'Write group name',
                obsecuretext: false,
              ),
              SizedBox(height: Get.height * 0.01),
              Row(
                children: [
                  Text(
                    'Short Description',
                    style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0xffEEEEF0),
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: Get.height * 0.15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 1, color: Color(0xff393A40)),
                ),
                child: TextFormField(
                  
                  controller: controller.descriptioncontroller,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10),
                    border: InputBorder.none,
                    hint: Text(
                      'Write short description here....',
                      style: GoogleFonts.manrope(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Color(0xff6C6E79),
                      ),
                    ),
                  ),
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Approval required to join',
                    style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0xffEEEEF0),
                    ),
                  ),
                  Obx(
                    () => Switch(
                      value: controller.isPrivate.value,
                      onChanged: controller.private,
                    ),
                  ),
                ],
              ),
              SizedBox(height: Get.height * 0.06),
              GestureDetector(
                onTap: () => controller.createGroup(),
                child: Obx(() => controller.isLoading.value?CircularProgressIndicator(color: Colors.white,):CommonButton(tittle: 'Create Group'),))
            ],
          ),
        ),
      ),
    );
  }
}
