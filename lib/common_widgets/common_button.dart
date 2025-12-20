import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({super.key, required this.tittle});
final String tittle;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height*0.1,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white
      ),
      child: Center(
        child: Text(tittle,
        style: GoogleFonts.inter( 
          color: Colors.black
        ),
        ),
      ),
    );
  }
}