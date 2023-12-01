import 'package:flutter/material.dart';

class AppColorsLight{
  static const appBarColor = Colors.white;
  static const primaryColor = Colors.deepOrange;
  static const secondaryColor = Colors.grey;
  static const lightColor = Colors.white;

}
ThemeData getThemeDataLight() => ThemeData(
  useMaterial3: true,
  primaryColor: AppColorsLight.primaryColor,

  appBarTheme: const AppBarTheme(
      color: AppColorsLight.appBarColor
  ),

  // iconButtonTheme:IconButtonThemeData(
  //   style: ButtonStyle(
  //     backgroundColor: MaterialStateProperty.all(
  //      AppColorsLight.primaryColor.shade400,
  //     )
  //   )
  // ),
  // textButtonTheme: TextButtonThemeData(
  //     style: ButtonStyle(
  //       backgroundColor: MaterialStateProperty.all(
  //         AppColorsLight.primaryColor.shade400,
  //       ),
  //     )
  // ),

);