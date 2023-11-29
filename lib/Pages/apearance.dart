import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/Pages/Main.dart';
import 'package:restaurant/core/theme/app_color/app_color_light.dart';

class Apearance extends StatefulWidget {
  final int selectedPage;
  const Apearance({super.key,required this.selectedPage});

  @override
  State<Apearance> createState() => _ApearanceState();
}

class _ApearanceState extends State<Apearance> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColorsLight.lightColor,
      appBar: AppBar(
        elevation: 0,
        title:
        Text(
            "Apearance",
            style: GoogleFonts.aladin(
              color: AppColorsLight.primaryColor,
              fontSize: 45,
            )
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Main(selectedPage: widget.selectedPage,sliding: 0),));
          },
          icon: const Icon(Icons.arrow_back_ios,color: AppColorsLight.primaryColor),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.transparent)
          ),
        ),
      ),

      body: Center(
        child: Container(color: AppColorsLight.lightColor,
          child: Text("Coming Soon....",style: TextStyle(color: AppColorsLight.primaryColor,fontSize: 50,fontWeight: FontWeight.w500)),
        ),
      ),
    );
  }
}

