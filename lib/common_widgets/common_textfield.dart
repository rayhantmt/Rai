import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Commontextfield extends StatelessWidget {
  const Commontextfield({super.key, required this.tittle, required this.hint,required this.obsecuretext,this.suffix});
final String tittle;
final String hint;
final bool obsecuretext;
final Widget? suffix;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(tittle,
        style: GoogleFonts.roboto( fontWeight: FontWeight.w600,fontSize: 14,color: Color(0xffEEEEF0)),
        ),
        Container(
          height: Get.height*0.04,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white.withOpacity(0.8)
            ),
            borderRadius: BorderRadius.circular(12)
          ),
          child: TextFormField(
          style: GoogleFonts.inter( color: Colors.white),
            obscureText: obsecuretext,
            decoration: InputDecoration(
              border: InputBorder.none,
              suffix: suffix,
              hint: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(hint,
                style: GoogleFonts.roboto( fontWeight: FontWeight.w400,fontSize: 12,
                color: Colors.white.withOpacity(0.6)
                ),
                ),
                
              )
            ),
          ),
        ),
      ],
    );
  }
}