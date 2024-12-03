import 'package:flutter/material.dart';
import 'colors_manager.dart';
import 'styles_manager.dart';

ThemeData getDarkTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: ColorsManager.darkBlue,

    // divider theme
    dividerTheme: const DividerThemeData(
      color: ColorsManager.black,
      thickness: 2,
    ),

    // text selection theme
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ColorsManager.red,
      selectionColor: ColorsManager.red.withOpacity(0.5),
      // Change the handle to blue for the text form field ;)
      selectionHandleColor: ColorsManager.red,
    ),

    // text form field theme
    inputDecorationTheme: InputDecorationTheme(
      // content padding
      contentPadding: const EdgeInsets.all(16),
      hintStyle: Styles.style16Medium(),
      errorStyle: Styles.style10Regular().copyWith(color: ColorsManager.red),
      labelStyle: Styles.style16Medium(),
      //default border
      border: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorsManager.gold, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(16))),
      // enabled border style
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorsManager.gold, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(16))),
      // focused border style
      focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorsManager.gold, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(16))),
      // error border style
      errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorsManager.red, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(16))),
      // focused border style
      focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorsManager.red, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(16))),
    ),

    // floating action button theme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      iconSize: 24,
      foregroundColor: ColorsManager.darkBlue,
      backgroundColor: ColorsManager.gold,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),

    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        //side: const BorderSide(color: ColorsManager.blue, width: 2),
        elevation: 0,
        foregroundColor: ColorsManager.darkBlue,
        backgroundColor: ColorsManager.gold,
        textStyle: Styles.style20Bold(),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
    ),
  );
}
