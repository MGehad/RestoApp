import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/Pages/Main.dart';
import 'package:restaurant/models/favorite_list.dart';
import 'package:restaurant/components/menu_card.dart';
import 'package:restaurant/core/theme/app_color/app_color.dart';

class Favorite extends StatefulWidget {
  int selectedPage;
  Favorite({super.key,required this.selectedPage});

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
        Center(
          child: Text(
              "Favroite",
              style: GoogleFonts.aladin(
                color: AppColorsLight.primaryColor,
                fontSize: 45,
              )
          ),
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

      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: FavoriteList.items.length,
        itemBuilder: (context, index) => MenuCard(
          food: FavoriteList.items[index],
          selectedPage: widget.selectedPage,
          sliding: 0,
        ),
      ),
    );
    }
  }






