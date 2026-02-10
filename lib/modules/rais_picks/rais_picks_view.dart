import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rai/modules/rais_picks/rais_pics_controller.dart';
import 'package:rai/utils/app_images.dart';

class RaisPicksView extends GetView<RaisPicsController> {
  const RaisPicksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppImages.primarycolor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: Get.height * 0.06),
              Text(
                "rai's Picks",
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                  color: Color(0xffEEEEF0),
                ),
              ),
              SizedBox(height: Get.height * 0.02),
              SizedBox(
                height: Get.height * 0.2,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.picks.length,
                  itemBuilder: (context, index) => SizedBox(
                    height: Get.height * 0.1,
                    child: Container(
                      width: Get.width * 0.3,
                      child: Column(
                        children: [
                          Text(
                            controller.picks[index].type,
                            style: GoogleFonts.manrope(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: Color(0xffEEEEF0),
                            ),
                          ),
                          Divider(
                            height: 1,
                            indent: 5,
                            endIndent: 5,
                            color: Colors.white,
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
    );
  }
}
