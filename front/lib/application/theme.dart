import 'dart:ui';

import 'package:flutter/material.dart';

class GoFlutterChatTheme {
  static const TextStyle appBarTextStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 18,
    color: _Colors.black,
  );

  static ThemeData themeData = goFlutterChatThemeData(colorScheme);

  static ThemeData goFlutterChatThemeData(ColorScheme colorScheme) {
    return ThemeData(
      useMaterial3: false,
      scaffoldBackgroundColor: _Colors.chablis,
      colorScheme: colorScheme,
      textTheme: _textTheme,
      scrollbarTheme: ScrollbarThemeData(
          trackColor: MaterialStatePropertyAll(_Colors.calmShell),
          thumbColor: MaterialStatePropertyAll(_Colors.calmShell)),
      dialogBackgroundColor: _Colors.chablis,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
        titleTextStyle: appBarTextStyle,
        backgroundColor: _Colors.white,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            EdgeInsets.zero,
          ),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        fillColor: _Colors.athensGray,
        focusColor: _Colors.athensGray,
        hoverColor: _Colors.athensGray,
        filled: true,
        isDense: true,
        errorStyle: TextStyle(
          fontSize: 12,
          color: _Colors.burntSienna,
          fontWeight: FontWeight.w400,
        ),
        labelStyle: TextStyle(
          fontSize: 17,
          color: _Colors.spunPearl,
          fontWeight: FontWeight.w400,
        ),
        helperStyle: TextStyle(
          fontSize: 12,
          color: _Colors.spunPearl,
          fontWeight: FontWeight.w400,
        ),
        hintStyle: TextStyle(
          fontSize: 17,
          color: _Colors.spunPearl,
          fontWeight: FontWeight.w400,
        ),
        contentPadding: EdgeInsetsDirectional.only(top: 4, bottom: 4),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.zero,
        ),
        floatingLabelStyle: TextStyle(
          fontSize: 14,
          color: _Colors.spunPearl,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  static const ColorScheme colorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: _Colors.blueRibbon,
    onPrimary: _Colors.black,
    secondary: _Colors.chablis,
    onSecondary: _Colors.chablis,
    error: _Colors.burntSienna,
    onError: _Colors.burntSienna,
    background: _Colors.chablis,
    onBackground: _Colors.chablis,
    surface: _Colors.black,
    onSurface: _Colors.black,
  );
  static const TextTheme _textTheme = TextTheme(
    labelLarge: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
  );
}

class _Colors {
  static const Color chablis = Color(0xffFFF5F4);
  static const Color pippin = Color(0xffFFDFDF);
  static const Color calmShell = Color(0xffD0AFB3);

  static const Color white = Color(0xFFFFFFFF);
  static const Color burntSienna = Color(0xFFEB5757);
  static const Color blueRibbon = Color(0xFF0D72FF);
  static const Color athensGray = Color(0xFFFBFBFC);
  static const Color black = Color(0xFF000000);
  static const Color webOrange = Color(0xFFFFA800);
  static const Color waterloo = Color(0xFF828796);
  static const Color spunPearl = Color(0xFFA9ABB7);
}
