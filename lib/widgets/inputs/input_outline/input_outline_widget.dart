import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class InputOutlineWidget extends StatelessWidget {
  InputOutlineWidget(
      {super.key,
      required this.icon,
      required this.label,
      required this.textController,
      required this.onChanged,
      this.isPassword = false,
      this.keyboardType = TextInputType.text});
  final String label;
  final IconData icon;
  final bool isPassword;
  final TextInputType keyboardType;
  final TextEditingController textController;
  final Function(String) onChanged;

  final ValueNotifier<bool> _hidePassword = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      child: AnimatedBuilder(
          animation: _hidePassword,
          builder: (context, w) {
            return TextField(
              controller: textController,
              onChanged: onChanged,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.white),
              obscureText: isPassword && _hidePassword.value,
              keyboardType: keyboardType,
              decoration: InputDecoration(
                  hintText: label,
                  hintStyle: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.white),
                  prefixIcon: Icon(
                    icon,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  suffixIcon: !isPassword
                      ? null
                      : IconButton(
                          onPressed: () {
                            _hidePassword.value = !_hidePassword.value;
                          },
                          icon: Icon(
                            _hidePassword.value
                                ? MdiIcons.eyeOffOutline
                                : MdiIcons.eyeOutline,
                            color: Theme.of(context).hintColor,
                          )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          const BorderSide(color: Colors.white, width: 1)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          const BorderSide(color: Colors.white, width: 1))),
            );
          }),
    );
  }
}
