import 'dart:ui';

import 'package:flutter/material.dart';

abstract class CustomColor {
  Color thirdColor = const  Color.fromRGBO(39, 51, 137, 1);
  Color primaryColor = const  Color.fromRGBO(39, 51, 137, 1);
  Color statusBarPrimaryColor = const  Color.fromRGBO(39, 51, 137, 1);
  Color darkShadow = const Color.fromRGBO(0, 0, 0, 0.4);
  Color backgroundLight = const Color.fromRGBO(247, 247, 247, 1);
  Color error = const Color.fromRGBO(244, 67, 54, 1);
  Color buttonTextColor = const Color.fromRGBO(255, 255, 255, 1);
  Color secondary = const Color.fromRGBO(201, 150, 195, 1);
  Color backgroundColor = const Color.fromRGBO(255, 255, 255, 1);
  Color borderColor = const Color.fromRGBO(209, 209, 209, 1);
  Color onPrimary = const Color.fromRGBO(13, 13, 13, 1);
  Color transparent = const Color.fromRGBO(0, 0, 0, 0);
  Color primaryDark = const Color.fromRGBO(0, 0, 0, 1);
  Color disabledButton = const Color.fromRGBO(190, 190, 190, 1);
  Color buttonAdd = const Color.fromRGBO(255, 207, 69, 1);
  Color circleAvatar = const Color.fromRGBO(221, 196, 217, 1);
  Color circleAvatarSecondary = const Color.fromRGBO(140, 109, 135, 1);
  Color textGray = const Color.fromRGBO(131, 131, 131, 1);
  
}


extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}