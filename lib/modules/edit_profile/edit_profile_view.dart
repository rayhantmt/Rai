import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:rai/common_widgets/common_button.dart';
import 'package:rai/modules/edit_profile/edit_profile_controller.dart';
import 'package:rai/utils/app_images.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({super.key});

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
              SizedBox(height: Get.height * 0.07),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Image.asset(
                      AppImages.commentconcernbackicon,
                      height: Get.height * 0.05,
                    ),
                  ),
                  SizedBox(width: Get.width * 0.05),
                  Text(
                    'Edit Profile',
                    style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                      color: Color(0xffEEEEF0),
                    ),
                  ),
                ],
              ),
              SizedBox(height: Get.height * 0.02),
              Container(
                height: Get.height * 0.15,
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(AppImages.profileimg),
                      radius: Get.height * 0.07,
                    ),
                    Column(
                      children: [
                        Text(
                          'Must be JPG,JPEG or PNG',
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
                        Spacer(),
                        Text(
                          'UPload Image',
                          style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Color(0xffEEEEF0),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.02),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                height: 1,
                indent: 1,
                endIndent: 1,
                thickness: 1,
                color: Color(0xff393A40),
              ),
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
                          color: Color(0xffEEEEF0),
                        ),
                      ),
                      Container(
                        height: Get.height * 0.05,
                        width: Get.width * 0.4,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Color(0xff393A40),
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10),
                            border: InputBorder.none,
                            hint: Text(
                              'Enter first name',
                              style: GoogleFonts.manrope(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
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
                          color: Color(0xffEEEEF0),
                        ),
                      ),
                      Container(
                        height: Get.height * 0.05,
                        width: Get.width * 0.4,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Color(0xff393A40),
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10),
                            border: InputBorder.none,
                            hint: Text(
                              'Enter last name',
                              style: GoogleFonts.manrope(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Text('Bio',
              style: GoogleFonts.manrope( 
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colors.white
              ),
              ),
              SizedBox(height: Get.height*0.02,),
              Container(
                height: Get.height*0.22,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Color(0xff393A40)
                  ),
                  borderRadius: BorderRadius.circular(12)
                ),
                
              ),
              SizedBox(height: Get.height*0.03,),
              Text('Date of Birth',
               style: GoogleFonts.manrope( 
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colors.white
              ),
              ),
              SizedBox(height: Get.height*0.03,),
              GestureDetector(
                onTap: () async{
                  DateTime? pickedDate= await showDatePicker(context: context, firstDate: DateTime(1000), lastDate: DateTime.now());
                 controller.birthdate.value=pickedDate!;
                } ,
                child: Container(
                  height: Get.height*0.05,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Color(0xff5F606A)
                    ),
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(() => Text(DateFormat('yyyy-mm-dd').format(controller.birthdate.value),
                        style: GoogleFonts.manrope(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xffEEEEF0)
                        ),
                        ),),
                        Icon(Icons.calendar_month_outlined,
                        color: Color(0xffEEEEF0),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: Get.height*0.09,),
              CommonButton(tittle: 'Update Info')
            ],
          ),
        ),
      ),
    );
  }
}
