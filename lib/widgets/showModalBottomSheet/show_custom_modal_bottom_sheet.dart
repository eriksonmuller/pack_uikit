import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

showCustomModalBottomSheet(
  BuildContext context,
  Widget content, {
  double? initialChildSize,
  double? minChildSize,
  double? maxChildSize,
  bool? isScrollable,
  bool? isDismissible,
  bool? enableDrag,
  double? horizontalPadding,
  double? verticalPadding,
}) {
  return showModalBottomSheet(
    isDismissible: isDismissible ?? false,
    isScrollControlled: isScrollable ?? true,
    enableDrag: enableDrag ?? false,
    useRootNavigator: true,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
    context: context,
    builder: (context) => DraggableScrollableSheet(
      initialChildSize: initialChildSize ?? 0.9,
      maxChildSize: maxChildSize ?? 0.9,
      minChildSize: minChildSize ?? 0.8,
      expand: false,
      builder: (context, scrollController) {
        return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding ?? 35.w,
                vertical: verticalPadding ?? 30.h),
            child: content);
      },
    ),
  );
}
