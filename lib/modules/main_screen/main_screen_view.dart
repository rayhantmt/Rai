import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rai/utils/app_images.dart';

class MainScreenView extends StatelessWidget {
  const MainScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: 
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 0.5,
                color: Color(0xff6C6E79)
              )
            ),
            height: Get.height*0.75,
            width: double.infinity,
            child: Row(
              children: [
                Column(
                  children: [
                    Image.asset(AppImages.homeicon),
                    Text('Home'),

                  ],
                )
              ],
            ),
          )
          )
        ],
      ),
    );
  }
}