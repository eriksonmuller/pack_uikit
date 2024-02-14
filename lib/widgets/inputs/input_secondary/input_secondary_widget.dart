import 'package:flutter/material.dart';

class InputSecondaryWidget extends StatelessWidget {
  final String title;
  const InputSecondaryWidget({Key? key, this.title = "InputSecondaryWidget"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text(title);
  }
}