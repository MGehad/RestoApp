import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/core/theme/app_color/app_color.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColorsLight.lightColor,
      appBar: AppBar(
        elevation: 0,
        title:
        Text(
            "My Orders",
            style: GoogleFonts.aladin(
              color: AppColorsLight.primaryColor,
              fontSize: 45,
            )
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
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

