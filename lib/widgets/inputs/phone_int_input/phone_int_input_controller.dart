import 'package:flutter/material.dart';

class PhoneIntInputController {
  String errorText;

  String label;

  Function callback;

  bool isValid;

  TextEditingController ctr;

  inputChange(value) => callback(value);

  bool iconPasswordClicked = false;

  changeVisibilityPassword() => iconPasswordClicked = !iconPasswordClicked;

  PhoneIntInputController(
      {required this.label,
      required this.errorText,
      required this.callback,
      required this.isValid,
      required this.ctr});
}
