import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class SocialButtonsWidget extends StatelessWidget {
  SocialButtonsWidget(
      {Key? key,
      required this.facebook,
      required this.google,
      required this.apple})
      : arguments = [facebook, google, apple],
        super(key: key);

  final Map<String, dynamic> apple;
  final Map<String, dynamic> facebook;
  final Map<String, dynamic> google;

  List arguments = [];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(3, (index) {
          return Visibility(
            visible: index == 2 ? Platform.isIOS : true,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: RawMaterialButton(
                onPressed: arguments[index]['callback'],
                fillColor: Colors.transparent,
                constraints: BoxConstraints(minWidth: 60.w, minHeight: 50.h),
                shape: RoundedRectangleBorder(
                    side: const BorderSide(
                        color: Colors.white,
                        width: 1),
                    borderRadius: BorderRadius.circular(15)),
                child: Icon(
                  arguments[index]['icon'],
                  color: Theme.of(context).hintColor,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
