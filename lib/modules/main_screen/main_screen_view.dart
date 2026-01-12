import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rai/modules/home/home_view.dart';
import 'package:rai/utils/app_images.dart';

class MainScreenView extends StatelessWidget {
  const MainScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          
          Expanded(child: HomeView()),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff19191B),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
                border: Border.all(width: 0.5, color: Color(0xff6C6E79)),
              ),
              height: Get.height * 0.1,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        AppImages.communityicon,
                        height: Get.height * 0.035,
                        //width: 30,
                      ),
                      Text('Home'),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        AppImages.aiicon,
                        color: Colors.white,
                        height: Get.height * 0.035,
                      ),
                      Text('Home'),
                    ],
                  ),Column(
                    children: [
                      Image.asset(
                        AppImages.homeicon,
                        height: Get.height * 0.035,
                      ),
                      Text('Home'),
                    ],
                  ),Column(
                    children: [
                      Image.asset(
                        AppImages.picksicon,
                        height: Get.height * 0.035,
                      ),
                      Text('Home'),
                    ],
                  ),Column(
                    children: [
                      Image.asset(
                        AppImages.moreicon,
                        height: Get.height * 0.035,
                      ),
                      Text('Home'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
