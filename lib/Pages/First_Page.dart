import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/Pages/Booking/Booking.dart';
import 'package:restaurant/Pages/MainPage.dart';
import 'package:restaurant/Pages/Menu.dart';
import 'package:restaurant/theme/app_color.dart';
import 'Orders/Orders_Page.dart';
import 'Settings/Settings.dart';

class FirstPage extends StatefulWidget {
  int selectedPage;
  int sliding;
  Function updateTheme;
  FirstPage({super.key,
    required this.selectedPage,
    required this.sliding,
  required this.updateTheme});

  @override
  State<FirstPage> createState() => _FirstPageState();

}

class _FirstPageState extends State<FirstPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Stack(
          children: [
            <Widget>[
              MainPage(selectedPage: widget.selectedPage,updateTheme: widget.updateTheme),
              Menu(selectedPage: widget.selectedPage,sliding: widget.sliding),
              Booking(updateTheme: widget.updateTheme),
              ShowOrderPage(),
              Settings(selectedPage: widget.selectedPage,
                  updateTheme: widget.updateTheme),
            ][widget.selectedPage],
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CurvedNavigationBar(
                    height: MediaQuery.of(context).size.height*0.09,
                    backgroundColor: Colors.transparent,
                    color: AppColors.primaryColor,
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
                          child: Icon(Icons.home,color: AppColors.lightColor)
                      ),
                      Tooltip(
                          message: "Menu",
                          child: Icon(Icons.restaurant_menu,color: AppColors.lightColor)
                      ),
                      Tooltip(
                          message: "Booking",
                          child: Icon(Icons.table_restaurant,color: AppColors.lightColor)
                      ),
                      Tooltip(
                          message: "Orders",
                          child: Icon(Icons.shopping_bag,color: AppColors.lightColor)
                      ),
                      Tooltip(
                          message: "Settings",
                          child: Icon(Icons.settings,color: AppColors.lightColor)
                      ),
                    ]
                ),
              ],
            ),
          ],
        )
    );
  }
}


