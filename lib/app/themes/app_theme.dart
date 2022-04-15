import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text.dart';

class AppTheme {
  static ThemeData get basic => ThemeData(
        colorScheme: ColorScheme.light().copyWith(
          primary: primaryColor,
        ),
        splashColor: secondaryColor,
        fontFamily: 'Baloo2',
        appBarTheme: AppBarTheme(
          titleTextStyle: kHeaderTextStyle.copyWith(
            color: Colors.white,
          ),
          iconTheme: IconThemeData(color: secondaryColor),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: secondaryColor,
        ),
        backgroundColor: bgColor,
      );
}
