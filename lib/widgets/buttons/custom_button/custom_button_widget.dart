import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum ButtonSize {
  smallSquare,
  mediumSquare,
  smallRounded,
  mediumRounded,
  largeRounded,
  xLargeRounded,
}

enum ButtonTextColor {
  primary,
  white,
  secundary,
  alternative,
}

enum CustomButtonStyle {
  square,
  smallRounded,
  rounded,
}

enum ButtonBorderColor {
  primary,
  secundary,
  white,
  alternative,
}

enum ButtonColor {
  primary,
  white,
  secundary,
  alternative,
  outlined,
  disabled
}

enum ButtonStatus { init, error, disabled, loading }

class CustomButtonWidget extends StatelessWidget {
  final String label;
  final ButtonSize size;
  final ButtonTextColor labelColor;
  final ButtonColor backgroundColor;
  final ButtonBorderColor? borderColor;
  final CustomButtonStyle? buttonStyle;
  final IconData? icon;
  final VoidCallback onPressed;
  final ButtonStatus buttonStatus;
  const CustomButtonWidget({
    Key? key,
    required this.label,
    required this.size,
    required this.labelColor,
    required this.backgroundColor,
    required this.buttonStyle,
    this.borderColor,
    this.icon,
    this.buttonStatus = ButtonStatus.init,
    required this.onPressed,
  }) : super(key: key);

  static Map<ButtonSize, double> _buttonWidths = {};

  static Map<ButtonSize, double> _buttonHeights = {};

  static Map<ButtonTextColor, Color> _buttonTextColor = {};

  static Map<CustomButtonStyle, double> _buttonStyle = {};

  static Map<ButtonBorderColor, Color> _buttonBorderColor = {};

  static Map<ButtonColor, Color> _buttonColors = {};

  _config(context) {
    _buttonWidths = {
      ButtonSize.smallSquare: 160.w,
      ButtonSize.mediumSquare: 200.w,
      ButtonSize.smallRounded: 152.w,
      ButtonSize.mediumRounded: 225.w,
      ButtonSize.largeRounded: 295.w,
      ButtonSize.xLargeRounded: 325.w
    };

    _buttonHeights = {
      ButtonSize.smallSquare: 50.h,
      ButtonSize.mediumSquare: 50.h,
      ButtonSize.smallRounded: 50.h,
      ButtonSize.mediumRounded: 50.h,
      ButtonSize.largeRounded: 55.h,
      ButtonSize.xLargeRounded: 60.h,
    };

    _buttonTextColor = {
      ButtonTextColor.primary: Theme.of(context).colorScheme.primary,
      ButtonTextColor.white: Colors.white,
      ButtonTextColor.secundary: Theme.of(context).colorScheme.secondary,
      ButtonTextColor.alternative: Theme.of(context).highlightColor,
    };

    _buttonStyle = {
      CustomButtonStyle.square: 5.0,
      CustomButtonStyle.smallRounded: 10.0,
      CustomButtonStyle.rounded: 40.0,
    };

    _buttonBorderColor = {
      ButtonBorderColor.primary: Theme.of(context).colorScheme.primary,
      ButtonBorderColor.white: Colors.white,
      ButtonBorderColor.secundary: Theme.of(context).colorScheme.secondary,
      ButtonBorderColor.alternative: Theme.of(context).highlightColor,
    };

    _buttonColors = {
      ButtonColor.primary: Theme.of(context).colorScheme.primary,
      ButtonColor.white: Colors.white,
      ButtonColor.secundary: Theme.of(context).colorScheme.secondary,
      ButtonColor.alternative: Theme.of(context).highlightColor,
      ButtonColor.outlined: Colors.transparent,
      ButtonColor.disabled: Theme.of(context).hintColor,
    };

   

  }

  @override
  Widget build(BuildContext context) {
    _config(context);
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          textStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
          foregroundColor: _buttonTextColor[labelColor],
          backgroundColor:
          buttonStatus == ButtonStatus.disabled
          ?_buttonColors[ButtonColor.disabled]
           :_buttonColors[backgroundColor],
          minimumSize:
              Size(_buttonWidths[size] ?? 295.w, _buttonHeights[size] ?? 50.h),
          padding: icon != null
              ? EdgeInsets.only(
                  right: size == ButtonSize.smallSquare ? 70.w : 10.w)
              : null,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(_buttonStyle[buttonStyle] ?? 40.0),
            side: BorderSide(
                color: _buttonBorderColor[borderColor] ?? Colors.transparent),
          ),
        ),
        onPressed: buttonStatus == ButtonStatus.init ||
                buttonStatus == ButtonStatus.error
            ? onPressed
            : (){},
        child: buttonStatus == ButtonStatus.loading
            ? const Center(
                child: CircularProgressIndicator(
                    color: Colors.white),
              )
            : icon == null
                ? Text(label.toUpperCase())
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [Icon(icon), SizedBox(width: 8.w), Text(label)]));
  }
}
