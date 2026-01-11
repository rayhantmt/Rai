import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreenView extends StatelessWidget {
  const MainScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(child: 
          Container(
            height: Get.height*0.75,
            width: double.infinity,
            child: Row(
              children: [
                Column(
                  children: [
                    Image.asset(''),
                    Text(''),
                    
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