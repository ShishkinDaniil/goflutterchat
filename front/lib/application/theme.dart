import 'package:flutter/material.dart';

class GoFlutterChatTheme {
  static const TextStyle appBarTextStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 18,
    color: _Colors.black,
  );
  static const Color roomItemColor = _Colors.calmShell;

  static const shimmerGradient = LinearGradient(
    colors: [
      Color(0xFFEBEBF4),
      Color(0xFFF4F4F4),
      Color(0xFFEBEBF4),
    ],
    stops: [
      0.1,
      0.3,
      0.4,
    ],
    begin: Alignment(-1.0, -0.3),
    end: Alignment(1.0, 0.3),
    tileMode: TileMode.clamp,
  );
  static const TextStyle roomsUserNameTextStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle roomNameTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: _Colors.athensGray,
  );

  static ThemeData themeData = goFlutterChatThemeData(colorScheme);

  static ThemeData goFlutterChatThemeData(ColorScheme colorScheme) {
    return ThemeData(
      useMaterial3: false,
      scaffoldBackgroundColor: _Colors.chablis,
      colorScheme: colorScheme,
      textTheme: _textTheme,
      scrollbarTheme: const ScrollbarThemeData(
          trackColor: MaterialStatePropertyAll(_Colors.calmShell),
          thumbColor: MaterialStatePropertyAll(_Colors.calmShell)),
      dialogBackgroundColor: _Colors.chablis,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
        titleTextStyle: appBarTextStyle,
        backgroundColor: _Colors.pippin,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            EdgeInsets.zero,
          ),
          textStyle: MaterialStateProperty.all(
            const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: _Colors.pippin,
            ),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: _Colors.athensGray,
        focusColor: _Colors.athensGray,
        hoverColor: _Colors.athensGray,
        filled: true,
        isDense: true,
        errorStyle: const TextStyle(
          fontSize: 12,
          color: _Colors.burntSienna,
          fontWeight: FontWeight.w400,
        ),
        labelStyle: const TextStyle(
          fontSize: 17,
          color: _Colors.spunPearl,
          fontWeight: FontWeight.w400,
        ),
        helperStyle: const TextStyle(
          fontSize: 12,
          color: _Colors.spunPearl,
          fontWeight: FontWeight.w400,
        ),
        hintStyle: const TextStyle(
          fontSize: 17,
          color: _Colors.spunPearl,
          fontWeight: FontWeight.w400,
        ),
        contentPadding: const EdgeInsetsDirectional.all(4),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: _Colors.waterloo, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        floatingLabelStyle: const TextStyle(
          fontSize: 14,
          color: _Colors.spunPearl,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  static const ColorScheme colorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: _Colors.calmShell,
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

  static const Color burntSienna = Color(0xFFEB5757);
  static const Color athensGray = Color(0xFFFBFBFC);
  static const Color black = Color(0xFF000000);
  static const Color waterloo = Color(0xFF828796);
  static const Color spunPearl = Color(0xFFA9ABB7);
}
