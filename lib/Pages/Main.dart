import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/Pages/First.dart';
import 'package:restaurant/Pages/cart.dart';
import 'package:restaurant/core/theme/app_color/app_color.dart';

class Main extends StatefulWidget {
  int selectedPage;
  int sliding;
  Main({super.key,required this.selectedPage,required this.sliding});
  @override
  State<Main> createState() => _MainState();

}

class _MainState extends State<Main> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => Cart(selectedPage: widget.selectedPage,sliding: widget.sliding),
      child: MaterialApp(
        home: First(selectedPage: widget.selectedPage,sliding: widget.sliding),
        theme: getThemeDataLight(),
      ),
    );
  }

}
