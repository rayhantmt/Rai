import 'package:flutter/material.dart';
import 'package:rai/utils/app_images.dart';

class UpdateCommunityView extends StatelessWidget {
  const UpdateCommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Scaffold(backgroundColor: AppImages.primarycolor),
          Scaffold(backgroundColor: Colors.red),
        ],
      ),
    );
  }
}
