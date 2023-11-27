import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Booking extends StatelessWidget {
  const Booking({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title:
        Center(
          child: Text(
              "Booking",
              style: GoogleFonts.aladin(
                color: Colors.deepOrange,
                fontSize: 45,
              )
          ),
        ),
      ),

      body: ListView(
          children: [
            Column(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 70),
                      child: Container(color: Colors.white,
                        child: Text("Coming Soon....",style: TextStyle(color: Colors.deepOrange,fontSize: 50,fontWeight: FontWeight.w500)),
                      ),
                    )
                  ],
                )
              ],
            )
          ]
      ),
    );
  }
}

