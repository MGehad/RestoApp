import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/theme/app_color.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.lightColor,
      appBar: AppBar(
        elevation: 0,
        title:
        Text(
            "Privacy Policy",
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
        child: Container(color: AppColors.lightColor,
          child: Text("Coming Soon....",style: TextStyle(color: AppColors.primaryColor,fontSize: 50,fontWeight: FontWeight.w500)),
        ),
      ),
    );
  }
}

