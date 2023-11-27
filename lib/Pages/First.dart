import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/Pages/Booking.dart';
import 'package:restaurant/Pages/Favorite.dart';
import 'package:restaurant/Pages/MainPage.dart';
import 'package:restaurant/Pages/Menu.dart';
import 'package:restaurant/Pages/Settings.dart';
import 'package:restaurant/core/theme/app_color/app_color_light.dart';

class First extends StatefulWidget {
  int selectedPage;
  First({super.key,
    required this.selectedPage});

  @override
  State<First> createState() => _MainState();

}

class _MainState extends State<First> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(right: 25,left: 25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: AppColorsLight.primaryColor
          ),
          child: NavigationBar(
              destinations: [
            NavigationDestination(icon: Icon(Icons.home),label: "Home",),
            NavigationDestination(icon: Icon(Icons.restaurant_menu),label: "Menu",),
            NavigationDestination(icon: Icon(Icons.table_restaurant),label: "Booking",),
            NavigationDestination(icon: Icon(Icons.favorite),label: "Favorite",),
            NavigationDestination(icon: Icon(Icons.settings),label: "Settings",),
          ],

            selectedIndex:widget.selectedPage,

            onDestinationSelected: (value) {
              setState(() {
                widget.selectedPage=value;
              });
            },
            backgroundColor: Colors.transparent,
            height: 65,
            indicatorColor: AppColorsLight.primaryColor.shade300,
            elevation: 0,
          ),
        ),

        backgroundColor: AppColorsLight.lightColor,

        body: <Widget>[
          MainPage(selectedPage: widget.selectedPage),
          Menu(selectedPage: widget.selectedPage),
          Booking(),
          Favorite(selectedPage: widget.selectedPage),
          Settings(selectedPage: widget.selectedPage),
        ][widget.selectedPage],
    );
  }

}


