import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:rai/utils/app_images.dart';

class CommunityView extends GetView {
  const CommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppImages.primarycolor,
      body: Center(
        child: Text('Community',
        style: TextStyle(
          color: Colors.white
        ),
        ),
      ),
    );
  }
}