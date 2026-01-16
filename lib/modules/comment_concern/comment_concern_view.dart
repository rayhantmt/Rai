import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentConcernView extends StatelessWidget {
  const CommentConcernView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Get.height*0.1,
            )
          ],
        ),
      ),
    );
  }
}