import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AppTheme {

  final bool isDarkMode;

  AppTheme({
    this.isDarkMode = false
  });

  ThemeData getTheme() {
    var baseTheme = ThemeData();

    return ThemeData(
      useMaterial3: true,
      // colorScheme: isDarkMode 
      // ? const ColorScheme.dark().copyWith(
      //   primary: Colors.green,
      // )
      // : const ColorScheme.light().copyWith(
      //   primary: Colors.green
      // ),
      colorSchemeSeed: Colors.green,
      textTheme: GoogleFonts.interTextTheme(baseTheme.textTheme).copyWith(
        displayMedium: GoogleFonts.inter(
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),
        displaySmall: GoogleFonts.inter(
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),
        titleLarge: GoogleFonts.inter(
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),
        titleSmall: GoogleFonts.inter(
          fontWeight: FontWeight.bold
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5)
          )
        )
      )
    );
  } 

  AppTheme copyWith({
    final bool? isDarkMode
  }) => AppTheme(
    isDarkMode: isDarkMode ?? this.isDarkMode
  );

}