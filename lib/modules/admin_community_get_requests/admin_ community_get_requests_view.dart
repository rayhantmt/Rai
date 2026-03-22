import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rai/utils/app_images.dart';

class AdmincommunityGetRequestsView extends StatelessWidget {
  const AdmincommunityGetRequestsView({super.key});

  @override
  Widget build(BuildContext context) {
    final String role=Get.arguments['role'];
    return Scaffold(
      backgroundColor: AppImages.primarycolor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: Get.height*0.06,),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Image.asset(AppImages.commentconcernbackicon,height: Get.height*0.06,)),
                  SizedBox(width: Get.width*0.06,),
              Text('Member List',
              style: GoogleFonts.manrope( 
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Colors.white
              ),
              )
                ],
              ),
              Text(role,
              style: GoogleFonts.manrope( 
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Colors.white
              ),
              ),
                role== 'adimn'
                ? _admin():
                _user()
            ],
          ),
        ),
      ),
    );

  }
}

Widget _admin(){
  return Text('This is admin view',
  style: GoogleFonts.manrope( 
    fontWeight: FontWeight.w700,
    fontSize: 18,
    color: Colors.white
  ),
  );
}
Widget _user(){
  return Text('This is admin view',
  style: GoogleFonts.manrope( 
    fontWeight: FontWeight.w700,
    fontSize: 18,
    color: Colors.white
  ),
  );
}