import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'phone_int_input_controller.dart';

class PhoneIntInputWidget extends StatelessWidget {
  final PhoneIntInputController controller;

  const PhoneIntInputWidget({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
          style:  Theme.of(context).textTheme.bodyMedium,
          cursorColor: Theme.of(context).primaryColor,
          decoration: InputDecoration(
            counterStyle: Theme.of(context).textTheme.bodySmall,
            iconColor: Theme.of(context).primaryColor,
            prefixIconColor: Theme.of(context).primaryColor,
            suffixIconColor: Theme.of(context).primaryColor,
            fillColor: Theme.of(context).primaryColor,
            focusColor: Theme.of(context).primaryColor,
              hoverColor: Theme.of(context).primaryColor,
              hintStyle: Theme.of(context).textTheme.bodyMedium,
              errorText: controller.isValid ? null : controller.errorText,
              errorStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.red),
              focusedErrorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(
                    width: 1.5,
                    color: Colors.red), //HexColor.fromHex("#EBECED")),
              ),
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(
                    width: 1.5,
                    color: Colors.red), //HexColor.fromHex("#EBECED")),
              ),
              suffixIcon: controller.isValid
                  ? null
                  : GestureDetector(
                      onTap: () {
                        controller.ctr.text = "";
                        controller.inputChange("");
                      },
                      child: Icon(Icons.close,
                          color: Theme.of(context).hintColor)),
              enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                    width: 1,
                    color: Theme.of(context)
                        .hintColor), 
              ),
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).hintColor, width: 1),
                  borderRadius: BorderRadius.circular(15.0)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).hintColor, width: 1),
                  borderRadius: BorderRadius.circular(15.0))),
          // maxLines: this.maxLines,
          initialCountryCode: 'BR',
          onSaved: (p) {
            controller.inputChange(p!.completeNumber);
          },
          onChanged: (p) {
            controller.inputChange(p.completeNumber);
          },
          controller: controller.ctr,
        );
      
  }

 
}
