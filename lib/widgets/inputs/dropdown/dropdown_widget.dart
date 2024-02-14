import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DropDownWidget extends StatelessWidget {
  const DropDownWidget(
      {super.key,
      required this.items,
      required this.label,
      required this.selected,
      required this.onChanged});
  final List<String> items;
  final String label;
  final String selected;
  final Function(dynamic) onChanged;
  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:
                BorderSide(color: Theme.of(context).hintColor, width: 1)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Theme.of(context).hintColor, width: 1),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          hint: Text(label, style: Theme.of(context).textTheme.bodySmall),
          isDense: true,
          isExpanded: true,
          style: Theme.of(context).textTheme.bodySmall,
          icon: Icon(
            MdiIcons.chevronDown,
            color: Theme.of(context).primaryColor,
          ),
          value: selected,
          items: List.generate(
              items.length,
              (index) => DropdownMenuItem<String>(
                    value: items[index],
                    child: Text(
                      items[index],
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  )),
          onChanged: (Object? value) {
            onChanged(value);
          },
        ),
      ),
    );
  }
}
