import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/theme/app_color.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title:
        Text(
            "Profile",
            style: GoogleFonts.aladin(
              color: AppColors.primaryColor,
              fontSize: 45,
            )
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios,color: AppColors.primaryColor),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.transparent)
          ),
        ),
      ),

      body: Center(
        child: Container(
          child: Text("Coming Soon....",style: TextStyle(color: AppColors.primaryColor,fontSize: 50,fontWeight: FontWeight.w500)),
        ),
      ),
    );
  }
}

