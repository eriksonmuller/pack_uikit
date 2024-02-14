import 'package:easy_autocomplete/easy_autocomplete.dart';
import 'package:flutter/material.dart';

import '../../../theme/colors.dart';

class AutoCompleteWidget extends StatelessWidget {
  const AutoCompleteWidget(
      {super.key,
      required this.fetchSuggestions,
      required this.onSubmitted,
      required this.textSearchController,
      required this.label});
  final TextEditingController textSearchController;
  final Future<List<String>> Function(String) fetchSuggestions;
  final Function(String) onSubmitted;
  final String label;

  @override
  Widget build(BuildContext context) {
    return EasyAutocomplete(
        progressIndicatorBuilder:
            CircularProgressIndicator(color: Theme.of(context).primaryColor),
     /*    suggestionBuilder: (s) {

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 8.h),
            child: Row(
              children: [
                Expanded(
                    child: j.image != null
                        ? Image.network(j.image!)
                        : const Icon(Icons.coffee_maker_outlined)),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                    flex: 5,
                    child: Text(
                      j.name!,
                      style: Theme.of(context).textTheme.bodySmall,
                    ))
              ],
            ),
          );
        }, */
        inputTextStyle: Theme.of(context).textTheme.bodyMedium!,
        decoration: InputDecoration(
            hintText: label,
            hintStyle: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: HexColor.fromHex("#91919F")),
            prefixIcon: Icon(
              Icons.search,
              color: HexColor.fromHex("#91919F"),
            ),
            fillColor: HexColor.fromHex("#F0F0F3"),
            // isCollapsed: true,
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide:
                    BorderSide(color: HexColor.fromHex("#91919F"), width: 1)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide:
                    BorderSide(color: HexColor.fromHex("#91919F"), width: 1))),
        controller: textSearchController,
        asyncSuggestions: fetchSuggestions,
        onSubmitted: onSubmitted,
        onChanged: (value) {
          // options.value.add(value);
          //  tags.value.add(value);
        });
  }
}
