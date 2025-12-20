import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Firstpage extends StatelessWidget {
  const Firstpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff19191B),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          children: [
            SizedBox(height: Get.height*0.1,),
            Text('Are You 18 or Older?',
            style: GoogleFonts.inter( 
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: Colors.white
            ),
            )
          ],
        ),
      ),
    );
  }
}