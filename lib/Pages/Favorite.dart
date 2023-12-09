import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/models/favorite_list.dart';
import 'package:restaurant/components/menu_card.dart';
import 'package:restaurant/theme/app_color.dart';

class Favorite extends StatefulWidget {
  Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsLight.lightColor,
      appBar: AppBar(
        elevation: 0,
        title:
        Text(
            "Favroite",
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

      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: FavoriteList.items.length,
        itemBuilder: (context, index) => MenuCard(
          food: FavoriteList.items[index],
        ),
      ),
    );
    }
  }






