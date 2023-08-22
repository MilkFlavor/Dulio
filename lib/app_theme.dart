import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color notWhite = Color(0xFFEDF0F2);
  static const Color nearlyWhite = Color.fromARGB(255, 255, 195, 0);
  static const Color white = Color.fromARGB(255, 255, 214, 10);
  static const Color nearlyBlack = Color.fromARGB(255, 0, 8, 20);
  static const Color grey = Color.fromARGB(255, 0, 53, 102);
  static const Color dark_grey = Color.fromARGB(255, 0, 29, 61);

  static const Color darkText = Color.fromARGB(255, 0, 53, 102);
  static const Color darkerText = Color.fromARGB(255, 0, 53, 102);
  static const Color lightText = Color.fromARGB(255, 255, 214, 10);
  static const Color deactivatedText = Color(0xFF767676);
  static const Color dismissibleBackground = Color.fromARGB(255, 0, 29, 61);
  static const Color chipBackground = Color.fromARGB(255, 0, 8, 20);
  static const Color spacer = Color.fromARGB(255, 255, 195, 0);
  static const String fontName = 'Gotham';

  static const TextTheme textTheme = TextTheme(
    headlineMedium: display1,
    headlineSmall: headline,
    titleLarge: title,
    titleSmall: subtitle,
    bodyMedium: body2,
    bodyLarge: body1,
    bodySmall: caption,
  );

  static const TextStyle display1 = TextStyle(
    // h4 -> display1
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
    color: darkerText,
  );

  static const TextStyle headline = TextStyle(
    // h5 -> headline
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    color: darkerText,
  );

  static const TextStyle title = TextStyle(
    // h6 -> title
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
    color: darkerText,
  );

  static const TextStyle subtitle = TextStyle(
    // subtitle2 -> subtitle
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.04,
    color: darkText,
  );

  static const TextStyle body2 = TextStyle(
    // body1 -> body2
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.2,
    color: darkText,
  );

  static const TextStyle body1 = TextStyle(
    // body2 -> body1
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
    color: darkText,
  );

  static const TextStyle caption = TextStyle(
    // Caption -> caption
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
    color: lightText, // was lightText
  );
}
