import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taskatti/core/services/local_storage.dart';
import 'package:taskatti/core/utils/colors.dart';
import 'package:taskatti/features/splash_view.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox('user');
  AppLocalStorage().init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,

        //light theme
        theme: ThemeData(
            fontFamily: GoogleFonts.poppins().fontFamily,
            scaffoldBackgroundColor: AppColors.white,
            appBarTheme: AppBarTheme(backgroundColor: AppColors.white),
            inputDecorationTheme: InputDecorationTheme(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColors.blue)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColors.blue)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColors.pink)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColors.pink)))),

        //dark theme
        darkTheme: ThemeData(
          scaffoldBackgroundColor: AppColors.darkBackground,
          appBarTheme: AppBarTheme(backgroundColor: AppColors.blue),
        ),

        //home
        home: const SplashView());
  }
}
