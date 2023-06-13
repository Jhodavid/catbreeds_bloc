import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';



class AppTheme {

  final bool isDarkMode;

  AppTheme({
    this.isDarkMode = false
  });

  static const _blueApp = Color(0xff1a2b63);
  static const _greenLightApp = Color(0xffe8f8c8);

  ThemeData getTheme() {
    var baseTheme = ThemeData();

    return ThemeData(
      useMaterial3: true,
      primaryColor: _blueApp,
      secondaryHeaderColor: _greenLightApp,
      scaffoldBackgroundColor: const Color(0xFFE4E4E4),
      textTheme: GoogleFonts.interTextTheme(baseTheme.textTheme).copyWith(
        displaySmall: GoogleFonts.inter(
          color: _blueApp,
          fontWeight: FontWeight.bold,
          fontSize: 26,
        ),
        bodySmall: GoogleFonts.inter(
          color: _blueApp,
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: GoogleFonts.inter(
          color: _blueApp,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: GoogleFonts.inter(
          color: _blueApp,
          fontWeight: FontWeight.bold,
        ),
        titleSmall: GoogleFonts.inter(
          color: _greenLightApp
        ),
        titleMedium: GoogleFonts.inter(
          color: _blueApp,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: GoogleFonts.inter(
          color: _blueApp,
          fontWeight: FontWeight.bold
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        hoverColor: _greenLightApp,
        focusColor: _blueApp,
      ),
      textButtonTheme: TextButtonThemeData(        
        style: TextButton.styleFrom(
          iconColor: _blueApp,
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5)
          ),
        )
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: _blueApp,
        selectionHandleColor: _blueApp
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: _greenLightApp,
        circularTrackColor: Colors.grey,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: _greenLightApp,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark
        ),        
      ),
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: _blueApp,
          borderRadius: BorderRadius.circular(5)
        ),
        triggerMode: TooltipTriggerMode.tap
      )
    );
  } 

  AppTheme copyWith({
    final bool? isDarkMode
  }) => AppTheme(
    isDarkMode: isDarkMode ?? this.isDarkMode
  );

}