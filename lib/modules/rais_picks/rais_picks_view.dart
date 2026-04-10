import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart';
import 'package:rai/common_widgets/common_button.dart';
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
            Obx(() {
              if (controller.picksindex == 0) {
                return _bangForBuck();
              } else if (controller.picksindex == 3) {
                return _creatorspick();
              } else if (controller.picksindex == 1) {
                return _betBuilder();
              } else {
                return _dailypicks();
              }
            }),
          ],
        ),
      ),
    );
  }
}

Widget _dailypicks() {
  final controller = Get.find<RaisPicsController>();
  return Expanded(
    child: Column(
      children: [
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
                height: Get.height * 0.22,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xff191818), Color(0xff000000)],
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              AppImages.nba,
                              height: Get.height * 0.02,
                            ),
                            Text(
                              'NBA',
                              style: GoogleFonts.manrope(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Color(0xffEEEEF0),
                              ),
                            ),
                          ],
                        ),
                        Expanded(child: SizedBox()),
                        Row(
                          children: [
                            Image.asset(
                              AppImages.l1,
                              height: Get.height * 0.03,
                            ),
                            Text(
                              'VS',
                              style: GoogleFonts.manrope(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Color(0xff797B86),
                              ),
                            ),
                            Image.asset(
                              AppImages.l2,
                              height: Get.height * 0.03,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height * 0.015),
                    Divider(
                      height: 1,
                      indent: 1,
                      endIndent: 1,
                      color: Color(0xff393A40),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              AppImages.l1,
                              height: Get.height * 0.03,
                            ),
                            Text(
                              'New York Knicks',
                              style: GoogleFonts.manrope(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Color(0xffEEEEF0),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          controller.predictions[index].point,
                          style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Color(0xffEEEEF0),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: Get.height * 0.05,
                          width: Get.width * 0.25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color(0xff222325),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  controller.predictions[index].odds,
                                  style: GoogleFonts.manrope(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Color(0xffEEEEF0),
                                  ),
                                ),
                                Text(
                                  'Odds',
                                  style: GoogleFonts.manrope(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: Color(0xff797B86),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: Get.height * 0.05,
                          width: Get.width * 0.25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color(0xff222325),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  controller.predictions[index].confidence,
                                  style: GoogleFonts.manrope(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                    color: Color(0xffFFA220),
                                  ),
                                ),
                                Text(
                                  'Confidence',
                                  style: GoogleFonts.manrope(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: Color(0xff797B86),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: Get.height * 0.05,
                          width: Get.width * 0.25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color(0xff222325),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'View',
                                  style: GoogleFonts.manrope(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                    color: Color(0xffEEEEF0),
                                  ),
                                ),
                                Text(
                                  'Breakdown',
                                  style: GoogleFonts.manrope(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                    color: Color(0xffEEEEF0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height * 0.015),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppImages.addtoprolay),
                        // Image.asset(AppImages.viewbreakdown),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _betBuilder() {
  final cc = Get.find<RaisPicsController>();
  return Expanded(
    child: Column(
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.white, // Standard text color
              height: 1.5, // Adjust line spacing if needed
            ),
            children: [
              const TextSpan(
                text: 'For your picks to show in parlay builder click ',
              ),
              TextSpan(
                text: '“Add to Parlay”',
                style: TextStyle(
                  color: Colors.orange[800], // The specific accent color
                  fontWeight: FontWeight.bold,
                ),
              ),
              const TextSpan(text: ' on any picks of your choice'),
            ],
          ),
        ),
        //SizedBox(height: Get.height * 0.02),
        Text(
          'Your Stored Picks',

          style: GoogleFonts.manrope(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: Color(0xffEEEEF0),
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 4 / 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: 9, //cc.bets.length,

          itemBuilder: (context, index) => Container(
            height: Get.height * 0.007,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color(0xff303136),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(AppImages.betone, height: Get.height * 0.03),
                Text(
                  'VS',
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: Color(0xff797B86),
                  ),
                ),
                Image.asset(AppImages.bettow, height: Get.height * 0.03),
              ],
            ),
          ),
        ),
        Text(
          'Risk Level',
          style: GoogleFonts.manrope(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: Color(0xffEEEEF0),
          ),
        ),
        //  SizedBox(height: Get.height * 0.02),
        Stack(
          children: [
            Image.asset(AppImages.riskbar, width: double.infinity),
            Positioned(
              //bottom: 10,
              left: Get.width * 0.1 - 40,
              child: Image.asset(AppImages.riskindicator),
            ),
          ],
        ),
        // SizedBox(height: Get.height * 0.02),
        Text(
          'Your Parley',
          style: GoogleFonts.manrope(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: Color(0xffEEEEF0),
          ),
        ),
        Container(
          height: Get.height * 0.1,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color(0xff303136),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'OKC',
                    style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color(0xffEEEEF0),
                    ),
                  ),
                  Text(
                    '145+',
                    style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Color(0xff10B981),
                    ),
                  ),
                ],
              ),
              Divider(
                height: 1,
                indent: 1,
                endIndent: 1,
                color: Color(0xff5F606A),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Chief',
                    style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color(0xffEEEEF0),
                    ),
                  ),
                  Text(
                    '_210',
                    style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Color(0xffEF4444),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 5,),
        CommonButton(tittle: 'Send to live bet tracking'),
        SizedBox(height: 5,),
        Container(
          height: Get.height * 0.05,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Color(0xff393A40)),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Center(
            child: Text(
              'Celar Parlay',
              style: GoogleFonts.manrope(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Color(0xffEF4444),
              ),
            ),
          ),
        ),
        SizedBox(height: 5,),
        Container(
          height: Get.height * 0.05,
          width: Get.width * 0.4,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Color(0xffB2B3BD)),
            borderRadius: BorderRadius.circular(100),
            color: Color(0xff303136),
          ),
          child: Center(
            child: Text('84% Confidence',
            style: GoogleFonts.manrope( 
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: Color(0xffEEEEF0)
            ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _bangForBuck() {
  final controller = Get.find<RaisPicsController>();
  return Expanded(
    child: Column(
      children: [
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
                height: Get.height * 0.22,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xff191818), Color(0xff000000)],
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              AppImages.nba,
                              height: Get.height * 0.02,
                            ),
                            Text(
                              'NBA',
                              style: GoogleFonts.manrope(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Color(0xffEEEEF0),
                              ),
                            ),
                          ],
                        ),
                        Expanded(child: SizedBox()),
                        Row(
                          children: [
                            Image.asset(
                              AppImages.l1,
                              height: Get.height * 0.03,
                            ),
                            Text(
                              'VS',
                              style: GoogleFonts.manrope(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Color(0xff797B86),
                              ),
                            ),
                            Image.asset(
                              AppImages.l2,
                              height: Get.height * 0.03,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height * 0.015),
                    Divider(
                      height: 1,
                      indent: 1,
                      endIndent: 1,
                      color: Color(0xff393A40),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              AppImages.l1,
                              height: Get.height * 0.03,
                            ),
                            Text(
                              'New York Knicks',
                              style: GoogleFonts.manrope(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Color(0xffEEEEF0),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          controller.predictions[index].point,
                          style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Color(0xffEEEEF0),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: Get.height * 0.05,
                          width: Get.width * 0.25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color(0xff222325),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  controller.predictions[index].odds,
                                  style: GoogleFonts.manrope(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Color(0xffEEEEF0),
                                  ),
                                ),
                                Text(
                                  'Odds',
                                  style: GoogleFonts.manrope(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: Color(0xff797B86),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: Get.height * 0.05,
                          width: Get.width * 0.25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color(0xff222325),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  controller.predictions[index].confidence,
                                  style: GoogleFonts.manrope(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                    color: Color(0xffFFA220),
                                  ),
                                ),
                                Text(
                                  'Confidence',
                                  style: GoogleFonts.manrope(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: Color(0xff797B86),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: Get.height * 0.05,
                          width: Get.width * 0.25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color(0xff222325),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'View',
                                  style: GoogleFonts.manrope(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                    color: Color(0xffEEEEF0),
                                  ),
                                ),
                                Text(
                                  'Breakdown',
                                  style: GoogleFonts.manrope(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                    color: Color(0xffEEEEF0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height * 0.015),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppImages.addtoprolay),
                        // Image.asset(AppImages.viewbreakdown),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _creatorspick() {
  return Expanded(
    child: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: Get.height * 0.32,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff191818), Color(0xff000000)],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(AppImages.pickoftheday),
                    Column(
                      children: [
                        Text(
                          "Dr. Jones PICK",
                          style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w400,
                            fontSize: 22,
                            color: Color(0xffEEEEF0),
                          ),
                        ),
                        Row(
                          children: [
                            Image.asset(
                              AppImages.nfl,
                              height: Get.height * 0.03,
                            ),

                            Text(
                              'NFL',
                              style: GoogleFonts.manrope(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Color(0xffEEEEF0),
                              ),
                            ),
                            SizedBox(width: Get.width * 0.25),
                            Image.asset(AppImages.qq),
                            Text(
                              'VS',
                              style: GoogleFonts.manrope(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Color(0xff797B86),
                              ),
                            ),
                            Image.asset(AppImages.GG),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Image.asset(AppImages.qq),
                        Text(
                          'Cincinnati Bengals',
                          style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),

                    Text(
                      '+5.5',
                      style: GoogleFonts.manrope(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Creator comment ...',
                      style: GoogleFonts.manrope(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Color(0xffEEEEF0),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: Get.height * 0.06,
                      width: Get.width * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xff222325),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '+133',
                            style: GoogleFonts.manrope(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Color(0xffEEEEF0),
                            ),
                          ),
                          Text(
                            'Odds',
                            style: GoogleFonts.manrope(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Color(0xff797B86),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: Get.height * 0.06,
                      width: Get.width * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xff222325),
                      ),
                      child: Column(
                        children: [
                          Text(
                            '82%',
                            style: GoogleFonts.manrope(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: Color(0xffFFA220),
                            ),
                          ),
                          Text(
                            'Confidence',
                            style: GoogleFonts.manrope(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Color(0xff797B86),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: Get.height * 0.06,
                      width: Get.width * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xff222325),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'View',
                            style: GoogleFonts.manrope(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: Color(0xffEEEEF0),
                            ),
                          ),
                          Text(
                            'Breakdown',
                            style: GoogleFonts.manrope(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: Color(0xffEEEEF0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Get.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppImages.addtoprolay),
                    // Image.asset(AppImages.viewbreakdown),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: Get.height * 0.05),
          Image.asset(AppImages.coming_soon),
          SizedBox(height: Get.height * 0.05),
          Image.asset(AppImages.coming_soon),
          SizedBox(height: Get.height * 0.05),
          Image.asset(AppImages.coming_soon),
        ],
      ),
    ),
  );
}
