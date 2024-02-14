import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SimpleSwitchWidget extends StatelessWidget {
   SimpleSwitchWidget({super.key, required this.value,required this.label, required this.onChanged ,this.activeColor, this.inactiveColor});
  final ValueNotifier<bool> value;
  final String label;
   Color? activeColor;
   Color? inactiveColor;
   Function(bool) onChanged;


  @override
  Widget build(BuildContext context) {


      activeColor ??= Theme.of(context).primaryColor;
      inactiveColor ??= Theme.of(context).colorScheme.background;



    return SizedBox(
      height: 40.h,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            AnimatedBuilder(
                animation: value,
                builder: (context, w) {
                  return Switch(
                    
                      value: value.value,
                      activeColor: activeColor,
                      thumbColor: MaterialStatePropertyAll(!value.value ? activeColor : inactiveColor),
                      inactiveThumbColor: activeColor,
                      inactiveTrackColor: inactiveColor,
                      activeTrackColor: activeColor,
                  
                      trackOutlineColor: MaterialStatePropertyAll(
                          Theme.of(context).primaryColor),
                      onChanged: (b) {
                        value.value = b;
                        onChanged(b);
                      });
                })
          ]),
    );
  }
}
