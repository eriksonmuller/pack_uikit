import 'package:flutter/material.dart';

import 'themes.dart';

class CustomThemeData {
  CustomThemeData(
      {required this.light, required this.dark, required this.isDark});

  CustomTheme light;

  CustomTheme dark;

  bool isDark = false;

  ThemeData getThemeData({hasThema = false}) {
    return isDark
        ? dark.themeData(hasThema: hasThema)
        : light.themeData(hasThema: hasThema);
  }
}
