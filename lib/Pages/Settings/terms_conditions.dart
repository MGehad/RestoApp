import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/theme/app_color.dart';

class TermsConditions extends StatefulWidget {
  const TermsConditions({super.key});

  @override
  State<TermsConditions> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<TermsConditions> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title:
        Text(
            "Terms & Conditions",
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
          child: Text("Coming Soon....",
              style: TextStyle(color: AppColors.primaryColor,
                  fontSize: 50,
                  fontWeight: FontWeight.w500)
          ),
        ),
      ),
    );
  }
}

