import 'package:flutter/material.dart';
import 'package:multi_trigger_autocomplete/multi_trigger_autocomplete.dart';

import 'data.dart';
import 'models.dart';
import 'tag_autocomplete_options.dart';

class MyWidget extends StatelessWidget {
   MyWidget({super.key});
  final messages = [...sampleGroupConversation];

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

   MultiTriggerAutocomplete autoCompleteWidget() {
    return MultiTriggerAutocomplete(
      optionsAlignment: OptionsAlignment.bottom,
      autocompleteTriggers: [
        AutocompleteTrigger(
          trigger: '#',
          triggerOnlyAtStart: true,
          triggerOnlyAfterSpace: true,
          optionsViewBuilder: (context, autocompleteQuery, controller) {
            return HashtagAutocompleteOptions(
              query: autocompleteQuery.query,
              onHashtagTap: (Hashtag hashtag) {
                final autocomplete = MultiTriggerAutocomplete.of(context);
               
                return autocomplete.acceptAutocompleteOption(hashtag.name);
              },
            );
          },
        ),
      ],
      fieldViewBuilder: (context, controller, focusNode) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            focusNode: focusNode,
            controller: controller,
            style: Theme.of(context).textTheme.bodyMedium,
            decoration: const InputDecoration.collapsed(
              hintText: "Selecione Gostos, Ingredientes, Categorias...",
            ),
          ),
        );
      },
    );}
}