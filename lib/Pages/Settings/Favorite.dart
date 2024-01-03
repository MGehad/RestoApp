import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/components/favorite_card.dart';
import 'package:restaurant/models/favorite_list.dart';
import 'package:restaurant/theme/app_color.dart';

class Favorite extends StatefulWidget {
  Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  void update(){
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsLight.lightColor,
      appBar: AppBar(
        elevation: 0,
        title:
        Text(
            "Favorite",
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
        actions: [
          Tooltip(
            message: 'Delete All',
            child: IconButton(
              onPressed: () {
                FavoriteList.clear();
                update();
              },
              icon: Icon(Icons.delete_sweep,
                  color: AppColorsLight.primaryColor,
                size: 30,
              ),
            ),
          )
        ],
      ),

      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: FavoriteList.items.length,
        itemBuilder: (context, index) => FavoriteCard(
          food: FavoriteList.items[index],
          update: update,
        ),
      ),
    );
  }
}






