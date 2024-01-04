import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/Pages/First_Page.dart';
import 'package:restaurant/Pages/Settings/Cart.dart';
import 'package:restaurant/theme/app_color.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    final prefs = await SharedPreferences.getInstance();
    final bool darkMode = prefs.getBool('darkMode') ?? false;
    AppColors.darkMode = darkMode;
  }

  void update() {
    init();
  }

  void updateTheme() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => Cart(),
      child: MaterialApp(
        home: FirstPage(selectedPage: widget.selectedPage,
            sliding: widget.sliding,
            updateTheme: updateTheme),
        theme: ThemeData(
            brightness: AppColors.darkMode ? Brightness.dark : Brightness.light,
            useMaterial3: true,
            colorSchemeSeed: Colors.deepOrange,
            sliderTheme: const SliderThemeData(
                showValueIndicator: ShowValueIndicator.always),
            fontFamily: 'Bitter'),
      ),
    );
  }
}
