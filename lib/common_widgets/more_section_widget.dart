import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MoreSectionWidget extends StatelessWidget {
  final String tittle;
  final String img;
  const MoreSectionWidget({super.key, required this.tittle, required this.img});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(img),
        Text(
          tittle,
          style: GoogleFonts.manrope(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Color(0xffEEEEF0),
          ),
        ),
      ],
    );
  }
}
