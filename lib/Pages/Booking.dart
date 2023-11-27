import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/core/theme/app_color/app_color_light.dart';

class Booking extends StatelessWidget {
  const Booking({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColorsLight.lightColor,
      appBar: AppBar(
        elevation: 0,
        title:
        Center(
          child: Text(
              "Booking",
              style: GoogleFonts.aladin(
                color: AppColorsLight.primaryColor,
                fontSize: 45,
              )
          ),
        ),
      ),

      body: Center(
        child: Container(color: AppColorsLight.lightColor,
          child: Text("Coming Soon....",
              style: TextStyle(color: AppColorsLight.primaryColor,
                  fontSize: 50,
                  fontWeight: FontWeight.w500)),
        ),
      ),
    );
  }
}

