import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/Pages/First_Page.dart';
import 'package:restaurant/Pages/Settings/Cart.dart';
import 'package:restaurant/theme/app_color.dart';

void main() {
  runApp(HomePage(selectedPage: 0,sliding: 0,));
}


class HomePage extends StatefulWidget {
  int selectedPage;
  int sliding;
  HomePage({super.key,required this.selectedPage,required this.sliding});
  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => Cart(),
      child: MaterialApp(
        home: FirstPage(selectedPage: widget.selectedPage,sliding: widget.sliding),
        theme: getThemeDataLight(),
      ),
    );
  }
}
