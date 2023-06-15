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
        // surface: Color.fromRGBO(0, 0, 0, 1),
        surface: Color.fromRGBO(239, 239, 239, 1),
        onSurface: Color.fromRGBO(149, 150, 151, 1),
      ),
      textTheme: TextTheme(
          bodyLarge: GoogleFonts.urbanist(
            color: const Color.fromRGBO(33, 33, 33, 1),
          ),
          bodyMedium: GoogleFonts.urbanist(
            color: const Color.fromRGBO(33, 33, 33, 1),
          ),
          bodySmall: GoogleFonts.urbanist(
            color: const Color.fromRGBO(33, 33, 33, 1),
          ),
          displayLarge: GoogleFonts.urbanist(
            color: const Color.fromRGBO(33, 33, 33, 1),
          ),
          displayMedium: GoogleFonts.urbanist(
            color: const Color.fromRGBO(33, 33, 33, 1),
          ),
          displaySmall: GoogleFonts.urbanist(
            color: const Color.fromRGBO(33, 33, 33, 1),
          )));
}
