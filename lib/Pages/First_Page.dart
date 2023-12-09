import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/Pages/Booking.dart';
import 'package:restaurant/Pages/MainPage.dart';
import 'package:restaurant/Pages/Menu.dart';
import 'package:restaurant/Pages/Settings.dart';
import 'package:restaurant/theme/app_color.dart';

class FirstPage extends StatefulWidget {
  int selectedPage;
  int sliding;
  FirstPage({super.key,
    required this.selectedPage,
  required this.sliding});

  @override
  State<FirstPage> createState() => _FirstPageState();

}

class _FirstPageState extends State<FirstPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          height: MediaQuery.of(context).size.height*0.09,
          backgroundColor: Colors.transparent,
            color: AppColorsLight.primaryColor,
            animationDuration: Duration(milliseconds: 400),
            onTap: (value) {
            setState(() {
              widget.selectedPage=value;
            });
            },
            index:widget.selectedPage ,
            items: [
              Tooltip(
                message: "Main Page",
                  child: Icon(Icons.home,color: AppColorsLight.lightColor)
              ),
              Tooltip(
                  message: "Menu",
                  child: Icon(Icons.restaurant_menu,color: AppColorsLight.lightColor)
              ),
              Tooltip(
                  message: "Booking",
                  child: Icon(Icons.table_restaurant,color: AppColorsLight.lightColor)
              ),
              Tooltip(
                  message: "Settings",
                  child: Icon(Icons.settings,color: AppColorsLight.lightColor)
              ),

            ]
        ),

        /*Container(
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
        ),*/

        backgroundColor: AppColorsLight.lightColor,

        body: <Widget>[
          MainPage(selectedPage: widget.selectedPage),
          Menu(selectedPage: widget.selectedPage,sliding: widget.sliding),
          Booking(),
          Settings(selectedPage: widget.selectedPage),
        ][widget.selectedPage],
    );
  }

}


