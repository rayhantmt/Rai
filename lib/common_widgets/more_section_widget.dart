import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MoreSectionWidget extends StatelessWidget {
  final String tittle;
  final String img;
  const MoreSectionWidget({super.key, required this.tittle, required this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: Get.height*0.04,
      child: Row(
        children: [
          Image.asset(img),
          SizedBox(width: Get.width*0.05,),
          Text(
            tittle,
            style: GoogleFonts.manrope(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Color(0xffEEEEF0),
            ),
          ),
          Expanded(child: SizedBox()),
          Icon(Icons.arrow_forward_ios_rounded,
          color: Color(0xffB2B3BD),
          )
        ],
      ),
    );
  }
}
