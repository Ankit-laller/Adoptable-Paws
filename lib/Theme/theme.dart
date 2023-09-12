import 'package:adoptable_paws/Theme/theme_data/dark_theme.dart';
import 'package:adoptable_paws/Theme/theme_data/light_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const bool themeLight = true;
  static const bool themeDark = false;
  static ThemeData getThemeFromThemeMode(bool themeMode) {
    if (themeMode == themeLight) {
      return LightThemeData.lightThemeData();
    } else if (themeMode == themeDark) {
      return DarkThemeData.darkThemeData();
    }
    return LightThemeData.lightThemeData();
  }
}
