import 'package:flutter/material.dart';
import 'package:rai/utils/app_images.dart';

class SetPasswordPageView extends StatelessWidget {
  const SetPasswordPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppImages.primarycolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('Set a strong password!')
          ],
        ),
      ),
    );
  }
}