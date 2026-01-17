import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rai/utils/app_images.dart';

class CommentConcernView extends StatelessWidget {
  const CommentConcernView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: () => showModalBottomSheet(
          context: context,
          builder: (BuildContext) {
            return Container(
              height: Get.height * 0.4,
              decoration: BoxDecoration(
                color: Color(0xff222325),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Divider(
                        thickness: 2,
                        endIndent: Get.width * 0.4,
                        indent: Get.width * 0.4,
                        color: Colors.white,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Submit Comment & Concern',
                            style: GoogleFonts.manrope(
                              fontWeight: FontWeight.w700,
                              color: Color(0xffEEEEF0),
                              fontSize: 20,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Icon(
                              Icons.close,
                              color: Colors.red,
                              size: 32,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: Get.height * 0.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Color(0xff222325),
                          border: Border.all(
                            width: 1,
                            color: Color(0xff393A40),
                          ),
                        ),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(border: InputBorder.none),
                        ),
                      ),
                      SizedBox(height: Get.height*0.03,),
                      Container(
                        height: Get.height*0.05,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                          
                        ),
                        child: Center(
                          child: Text('Submit',
                          style: GoogleFonts.manrope( 
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Color(0xff19191B)
                          ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        child: Icon(
          Icons.add_circle_outline_sharp,
          color: Colors.white,
          size: 40,
        ),
      ),
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
                    onTap: () => Get.back(),
                    child: Image.asset(
                      AppImages.commentconcernbackicon,
                      height: Get.height * 0.05,
                    ),
                  ),

                  SizedBox(width: Get.width * 0.05),
                  Text(
                    'Comment & Concern',
                    style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                      color: Color(0xffEEEEF0),
                    ),
                  ),
                ],
              ),
              SizedBox(height: Get.height * 0.2),
              Center(
                child: Text(
                  'No comment & concern found',
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Color(0xffB2B3BD),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
