import 'package:flutter/material.dart';

abstract class CustomTheme {
  Color _primary = Colors.blue;

  get primaryColor => _primary;

  get secondary => Colors.green;

  get darkShadow => Colors.grey;

  get brightness => Brightness.light;

  get backgroundColor => Colors.white;

  get backgroundLight => Colors.white;

  get appBarTheme => null;

  get headline1 => null;

  get buttonTextColor => Colors.greenAccent;

  get bodyText1 => null;

  get scaffoldBackgroundColor => null;

  get unselectedWidgetColor => null;

  get onPrimary => Colors.white;

  get error => Colors.red;

  get transparent => Colors.transparent;

  get primaryDark => Colors.black;

  get textTheme => const TextTheme();

  set primary(Color primary) {
    _primary = primary;
  }

  get cardBackgroundColor => Colors.red;

  IconButtonThemeData? get iconButtonThemeData => null;
  IconThemeData? get iconThemeData => null;

  ThemeData themeData({hasThema = false}) {
    return ThemeData(
        brightness: brightness,
        primaryColor: primaryColor,
        primaryColorDark: primaryDark,
        disabledColor: transparent,
        colorScheme: ColorScheme(
          secondary: secondary,
          primary: primaryColor,
          background: backgroundColor,
          brightness: brightness,
          error: error,
          onBackground: backgroundLight,
          onError: error,
          onPrimary: onPrimary,
          onSecondary: secondary,
          onSurface: buttonTextColor,
          surface: onPrimary,
          shadow: darkShadow,
        ),
        iconButtonTheme: iconButtonThemeData,
        iconTheme: iconThemeData,
        
        cardTheme: CardTheme(color: cardBackgroundColor),
        hintColor: const Color.fromRGBO(190, 190, 190, 1),
        appBarTheme: appBarTheme,
        textTheme: textTheme,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        unselectedWidgetColor: unselectedWidgetColor);
  }
}
