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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
              height: Get.height * 0.05,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: controller.picks.length,
                itemBuilder: (context, index) => SizedBox(
                  height: Get.height * 0.1,
                  child: GestureDetector(
                    onTap: () => controller.selectpicks(index),
                    child: Container(
                      width: Get.width * 0.3,
                      child: Obx(
                        () => Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              controller.picks[index].type,
                              style: GoogleFonts.manrope(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: controller.picksindex.value == index
                                    ? Color(0xffEEEEF0)
                                    : Color(0xff6C6E79),
                              ),
                            ),
                            SizedBox(height: 4),
                            Container(
                              height: 1,

                              color: controller.picksindex.value == index
                                  ? Color(0xffEEEEF0)
                                  : Color(0xff6C6E79),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.045,

              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.games.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => controller.selectgames(index),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Obx(
                      () => Container(
                        width: Get.width * 0.25,

                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: controller.gamesindex.value == index
                                ? Color(0xffEEEEF0)
                                : Color(0xff393A40),
                          ),
                          borderRadius: BorderRadius.circular(100),
                          color: controller.gamesindex.value == index
                              ? Color(0xffEEEEF0)
                              : AppImages.primarycolor,
                        ),
                        child: Center(
                          child: Text(
                            controller.games[index].gametype,
                            style: GoogleFonts.manrope(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: controller.gamesindex.value == index
                                  ? Color(0xff19191B)
                                  : Color(0xff797B86),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: controller.predictions.length,
                shrinkWrap: true,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                    height: Get.height * 0.2,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xff191818), Color(0xff000000)],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
