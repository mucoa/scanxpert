import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scanxpert/src/constants/view_constants.dart';

abstract class IThemeCreator {
  ThemeData getDarkTheme();
  ThemeData getLightTheme();
}

class ThemeCreator extends IThemeCreator {
  late final BuildContext context;

  ThemeCreator(this.context);

  @override
  ThemeData getDarkTheme() => ThemeData(
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          centerTitle: false,
        ),
        brightness: Brightness.light,
        primarySwatch: kDarkModeSwatch,
        scaffoldBackgroundColor: kScaffoldBackGroundLightColor,
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: GoogleFonts.montserrat(
            textStyle: TextStyle(
              fontSize: 16.spMin,
            ),
          ),
        ),
        textTheme: TextTheme(
          titleLarge: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 32.spMin,
            color: kLightThemeTextColor,
          ),
          titleMedium: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 26.spMin,
            color: kLightThemeTextColor,
          ),
          titleSmall: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 20.spMin,
            color: kLightThemeTextColor,
          ),
          bodyLarge: GoogleFonts.montserrat(
            textStyle: TextStyle(
              fontSize: 18.spMin,
              color: kLightThemeTextColor,
            ),
          ),
          bodyMedium: GoogleFonts.montserrat(
            textStyle: TextStyle(
              fontSize: 16.spMin,
              color: kLightThemeTextColor,
            ),
          ),
          bodySmall: GoogleFonts.montserrat(
            textStyle: TextStyle(
              fontSize: 14.spMin,
              color: kLightThemeTextColor,
            ),
          ),
          labelLarge: GoogleFonts.montserrat(
            textStyle: TextStyle(
              fontSize: 18.spMin,
              color: kLightThemeTextColor,
            ),
          ),
          labelMedium: GoogleFonts.montserrat(
            textStyle: TextStyle(
              fontSize: 16.spMin,
              color: kLightThemeTextColor,
            ),
          ),
          labelSmall: GoogleFonts.montserrat(
            textStyle: TextStyle(
              fontSize: 14.spMin,
              color: kLightThemeTextColor,
            ),
          ),
          headlineMedium: GoogleFonts.montserrat(
            textStyle: TextStyle(
              fontSize: 18.spMin,
              fontWeight: FontWeight.w600,
              color: kSecondaryColor,
            ),
          ),
        ),
      );

  @override
  ThemeData getLightTheme() => ThemeData(
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          centerTitle: false,
        ),
        brightness: Brightness.dark,
        primarySwatch: kLightModeSwatch,
        scaffoldBackgroundColor: kScaffoldBackGroundDarkColor,
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: GoogleFonts.montserrat(
            textStyle: TextStyle(
              fontSize: 16.spMin,
              color: kDarkThemeTextColor,
            ),
          ),
        ),
        textTheme: TextTheme(
          titleLarge: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 32.spMin,
            color: kDarkThemeTextColor,
          ),
          titleMedium: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 26.spMin,
            color: kDarkThemeTextColor,
          ),
          titleSmall: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 20.spMin,
            color: kDarkThemeTextColor,
          ),
          bodyLarge: GoogleFonts.montserrat(
            textStyle: TextStyle(
              fontSize: 18.spMin,
              color: kDarkThemeTextColor,
            ),
          ),
          bodyMedium: GoogleFonts.montserrat(
            textStyle: TextStyle(
              fontSize: 16.spMin,
              color: kDarkThemeTextColor,
            ),
          ),
          bodySmall: GoogleFonts.montserrat(
            textStyle: TextStyle(
              fontSize: 14.spMin,
              color: kDarkThemeTextColor,
            ),
          ),
          labelLarge: GoogleFonts.montserrat(
            textStyle: TextStyle(
              fontSize: 18.spMin,
              color: kDarkThemeTextColor,
            ),
          ),
          labelMedium: GoogleFonts.montserrat(
            textStyle: TextStyle(
              fontSize: 16.spMin,
              color: kDarkThemeTextColor,
            ),
          ),
          labelSmall: GoogleFonts.montserrat(
            textStyle: TextStyle(
              fontSize: 14.spMin,
              color: kDarkThemeTextColor,
            ),
          ),
          headlineMedium: GoogleFonts.montserrat(
            textStyle: TextStyle(
              fontSize: 18.spMin,
              fontWeight: FontWeight.w600,
              color: kQuaternaryColor,
            ),
          ),
        ),
      );
}
