import 'package:flutter/material.dart';
import 'package:restaurant/core/theme/app_color/app_color_light.dart';

ThemeData getThemeDataLight() => ThemeData(
    useMaterial3: true,
    primaryColor: AppColorsLight.primaryColor,

    appBarTheme: const AppBarTheme(
        color: AppColorsLight.appBarColor
    ),

    iconButtonTheme:IconButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
         AppColorsLight.primaryColor.shade400,
        )
      )
    ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(
          AppColorsLight.primaryColor.shade400,
      ),
    )
  ),

);