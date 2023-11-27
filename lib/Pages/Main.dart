import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/Pages/Favorite.dart';
import 'package:restaurant/Pages/First.dart';
import 'package:restaurant/Pages/cart.dart';
import 'package:restaurant/core/theme/theme_data/theme_data_dark.dart';
import 'package:restaurant/core/theme/theme_data/theme_data_light.dart';

class Main extends StatefulWidget {
  int selectedPage;
  Main({super.key,required this.selectedPage});

  @override
  State<Main> createState() => _MainState();

}

class _MainState extends State<Main> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => Favorite(selectedPage: widget.selectedPage,),
      child: MaterialApp(
        home: First(selectedPage: widget.selectedPage),
        theme: getThemeDataLight(),
      ),
    );
  }

}
