import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rai/utils/app_images.dart';

class UserCredentialsPageView extends StatelessWidget {
  const UserCredentialsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppImages.primarycolor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Text('User Credential!',
              style: GoogleFonts.manrope( 
                fontWeight: FontWeight.w600,
                fontSize: 24,
                color: Colors.white
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}