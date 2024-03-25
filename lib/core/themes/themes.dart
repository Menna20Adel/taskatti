import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskatti/core/utils/colors.dart';

class AppThemes {
  //light theme
  static ThemeData appLightTheme = ThemeData(
      fontFamily: GoogleFonts.poppins().fontFamily,
      scaffoldBackgroundColor: AppColors.white,
      appBarTheme: AppBarTheme(
          backgroundColor: AppColors.white, foregroundColor: AppColors.blue),
      colorScheme: ColorScheme.fromSeed(
          primary: AppColors.blue,
          // secondary: ,
          background: AppColors.white,
          // text
          onSurface: AppColors.black,
          error: AppColors.red,
          seedColor: AppColors.blue),
      inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.black)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.blue)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.red)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.red))));

  //dark theme
  static ThemeData appDarkTheme = ThemeData(
      fontFamily: GoogleFonts.poppins().fontFamily,
      scaffoldBackgroundColor: AppColors.darkBackground,
      appBarTheme: AppBarTheme(
          backgroundColor: AppColors.darkBackground,
          foregroundColor: AppColors.blue),
      colorScheme: ColorScheme.fromSeed(
          primary: AppColors.blue,
          // secondary: ,
          background: AppColors.darkBackground,
          // text
          onSurface: AppColors.white,
          error: AppColors.red,
          seedColor: AppColors.blue),
      inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.white)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.blue)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.red)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.red))));
}
