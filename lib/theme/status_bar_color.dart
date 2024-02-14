import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';

class StatusBarColor {
  static changeStatusColor(Color color) async {
    await FlutterStatusbarcolor.setStatusBarColor(color);
  }

  static changeStatusBarBrightness({bool white = false}) async {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarBrightness: white ? Brightness.dark : Brightness.light));
  }

  static setWhite(){
    StatusBarColor.changeStatusBarBrightness(white: false);
    StatusBarColor.changeStatusColor(const Color.fromRGBO(242, 242, 242, 0.8));
  }

  static setPrimaryColor(){
 
    StatusBarColor.changeStatusColor(const Color.fromRGBO(255, 255, 255, 1));
    StatusBarColor.changeStatusBarBrightness(white: false);
  }
}
