import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color.fromRGBO(255, 195, 0, 1),
    primaryColorLight: const Color.fromRGBO(255, 195, 0, 0.5),
    disabledColor: const Color.fromRGBO(230, 230, 230, 1),
    splashColor: Colors.white,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color.fromRGBO(255, 195, 0, 1),
      onPrimary: Color.fromRGBO(255, 195, 0, 1),
      secondary: Color.fromRGBO(33, 33, 33, 1),
      onSecondary: Color.fromRGBO(33, 33, 33, 1),
      error: Color.fromRGBO(247, 90, 90, 1),
      onError: Color.fromRGBO(247, 90, 90, 1),
      background: Colors.white,
      onBackground: Color.fromRGBO(33, 33, 33, 1),
      surface: Color.fromRGBO(239, 239, 239, 1),
      onSurface: Color.fromRGBO(149, 150, 151, 1),
    ),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.urbanist(
          color: const Color.fromRGBO(33, 33, 33, 1),
          fontSize: 46,
          fontWeight: FontWeight.w700),
      bodyMedium: GoogleFonts.urbanist(
          color: const Color.fromRGBO(33, 33, 33, 1),
          fontSize: 32,
          fontWeight: FontWeight.w700),
      bodySmall: GoogleFonts.urbanist(
          color: const Color.fromRGBO(33, 33, 33, 1),
          fontSize: 18,
          fontWeight: FontWeight.w500),
      displayLarge: GoogleFonts.urbanist(
          color: const Color.fromRGBO(255, 195, 0, 1),
          fontSize: 96,
          fontWeight: FontWeight.bold),
      displayMedium: GoogleFonts.urbanist(
        color: const Color.fromRGBO(33, 33, 33, 1),
      ),
      displaySmall: GoogleFonts.urbanist(
        color: const Color.fromRGBO(33, 33, 33, 1),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
          side: const BorderSide(
            color: Color.fromRGBO(218, 218, 218, 0.47),
            width: 1,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16.0),
      ),
    ),
  );
}
