import 'package:flutter/material.dart';

import 'app_color_manger.dart';

class AppTheme {
  static final light = ThemeData(
    tabBarTheme: TabBarTheme(
        overlayColor: MaterialStateProperty.all(Colors.grey),
        indicator: BoxDecoration(
            color: AppColorManger.primary,
            borderRadius: BorderRadius.circular(18))),
    primaryColor: AppColorManger.primary,
    primaryColorLight: AppColorManger.lightFontColor,
    primaryColorDark: AppColorManger.darkFontColor,
    secondaryHeaderColor: AppColorManger.grey,
    scaffoldBackgroundColor: AppColorManger.lightScaffold,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      color: AppColorManger.primary,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontFamily: 'Cairo',
        color: AppColorManger.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          fontFamily: 'Cairo',
          color: AppColorManger.lightFontColor,
          fontSize: 32,
          fontWeight: FontWeight.bold),
      titleMedium: TextStyle(
        fontFamily: 'Cairo',
        color: AppColorManger.lightFontColor,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        fontFamily: 'Cairo',
        color: AppColorManger.lightFontColor,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Cairo',
        color: AppColorManger.lightFontColor,
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Cairo',
        color: AppColorManger.lightFontColor,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Cairo',
        color: AppColorManger.lightFontColor,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      displayLarge: TextStyle(
        fontFamily: 'Cairo',
        color: AppColorManger.lightFontColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        fontFamily: 'Cairo',
        color: AppColorManger.lightFontColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: TextStyle(
        fontFamily: 'Cairo',
        color: AppColorManger.lightFontColor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

   }

