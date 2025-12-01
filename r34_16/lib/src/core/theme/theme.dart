
import 'package:r34_16/src/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static ThemeData get defaultTheme {
    return ThemeData(
      colorSchemeSeed: AppColor.primary,
      fontFamily: "Gilroy",
      textTheme: const TextTheme(
        bodySmall: TextStyle(
          color: AppColor.primary,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(color: AppColor.placeholder),
        bodyMedium: TextStyle(color: AppColor.placeholder),
      ),
      scaffoldBackgroundColor: Colors.white,
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        elevation: 0.3,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontFamily: "Gilroy",
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primary,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.all(AppDefaults.padding),
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: AppDefaults.borderRadius),
          textStyle: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(AppDefaults.padding),
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: AppDefaults.borderRadius),
          textStyle: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Gilroy',
          ),
        ),
      ),
      inputDecorationTheme: secondaryInputDecorationTheme,
      sliderTheme: const SliderThemeData(
        showValueIndicator: ShowValueIndicator.onDrag,
        thumbColor: Colors.white,
      ),
      tabBarTheme: const TabBarThemeData(
        labelColor: AppColor.primary,
        unselectedLabelColor: AppColor.placeholder,
        labelPadding: EdgeInsets.all(AppDefaults.padding),
        indicatorSize: TabBarIndicatorSize.label,
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColor.primary,
        ),
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColor.placeholder,
        ),
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            color: AppColor.primary,
            width: 2,
          ),
        ),
      ),
    );
  }

  //InputDecorationTheme
  static const secondaryInputDecorationTheme = InputDecorationTheme(
  fillColor: AppColor.textInputBackground,
  filled: true,
  floatingLabelBehavior: FloatingLabelBehavior.never,
  border: OutlineInputBorder(
    borderSide: BorderSide(width: 0.1),
    borderRadius: BorderRadius.all(Radius.circular(8)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(width: 0.1),
    borderRadius: BorderRadius.all(Radius.circular(8)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(width: 0.1),
    borderRadius: BorderRadius.all(Radius.circular(8)),
  ),
  suffixIconColor: AppColor.placeholder,
);
}

