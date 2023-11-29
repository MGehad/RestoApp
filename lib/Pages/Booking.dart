import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/Pages/cart.dart';
import 'package:restaurant/core/theme/app_color/app_color_light.dart';

class Booking extends StatefulWidget {
  const Booking({Key? key}) : super(key: key);

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  int _selected = 0;

  BoxDecoration dec1 = BoxDecoration(
    color: AppColorsLight.primaryColor,
    shape: BoxShape.circle,
  );

  BoxDecoration dec2 = BoxDecoration();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsLight.lightColor,
      appBar: AppBar(
        elevation: 0,
        title: Center(
          child: Text(
            "Booking",
            style: GoogleFonts.aladin(
              color: AppColorsLight.primaryColor,
              fontSize: 45,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text(
                  "Choose Number Of Seats:",
                  style: GoogleFonts.aladin(
                    color: AppColorsLight.primaryColor,
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 50),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildSeatOption("Images/Seats/Four_Seats.png", "4", 0),
                        buildSeatOption("Images/Seats/Five_Seats.png", "5", 1),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildSeatOption("Images/Seats/Six_Seats.png", "6", 2),
                        buildSeatOption("Images/Seats/Eight_Seats.png", "8", 3),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all(AppColorsLight.primaryColor),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Cart(
                        selectedPage: 2,
                        sliding: 0,
                      ),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Next",
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: 20,
                        color: AppColorsLight.lightColor,
                      ),
                    ),
                    Icon(
                      Icons.arrow_right_outlined,
                      color: AppColorsLight.lightColor,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSeatOption(String imagePath, String seatCount, int index) {
    return InkWell(
      borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.2),
      onTap: () {
        setState(() {
          _selected = index;
        });
      },
      child: Ink(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(MediaQuery.of(context).size.width * 0.3),
          ),
          child: Container(
            decoration: (_selected == index) ? dec1 : dec2,
            height: MediaQuery.of(context).size.width * 0.3,
            width: MediaQuery.of(context).size.width * 0.3,
            child: Stack(
              children: [
                Center(child: Image.asset(imagePath)),
                Center(
                  child: Text(
                    seatCount,
                    style: GoogleFonts.allerta(
                      color: AppColorsLight.secondaryColor.shade800,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}