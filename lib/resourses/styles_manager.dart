import 'package:flutter/material.dart';
import 'colors_manager.dart';

class FontConstants {
  static const String fontInter = "Inter";
}

abstract class Styles {
  static TextStyle style10Regular() {
    return const TextStyle(
      fontFamily: FontConstants.fontInter,
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: ColorsManager.darkBlue,
    );
  }

  static TextStyle style14Medium() {
    return const TextStyle(
      fontFamily: FontConstants.fontInter,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: ColorsManager.darkBlue,
    );
  }

  static TextStyle style16Medium() {
    return const TextStyle(
      fontFamily: FontConstants.fontInter,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: ColorsManager.gold,
    );
  }

  static TextStyle style16Bold() {
    return const TextStyle(
      fontFamily: FontConstants.fontInter,
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: ColorsManager.gold,
    );
  }

  static TextStyle style20Bold() {
    return const TextStyle(
      fontFamily: FontConstants.fontInter,
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: ColorsManager.gold,
    );
  }
}
