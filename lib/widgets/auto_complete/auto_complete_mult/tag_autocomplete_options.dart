import 'package:flutter/material.dart';

import 'data.dart';
import 'models.dart';

class HashtagAutocompleteOptions extends StatelessWidget {
    HashtagAutocompleteOptions({
    Key? key,
    required this.query,
    required this.onHashtagTap,
  }) : super(key: key);

  final String query;
  final ValueSetter<Hashtag> onHashtagTap;
   ValueNotifier<List<Hashtag>> hashtags = ValueNotifier(kHashtags);
  @override
  Widget build(BuildContext context) {
    

/*  var hashtags = kHashtags.where((it) {
      final normalizedOption = it.name.toLowerCase();
      final normalizedQuery = query.toLowerCase();
      return normalizedOption.contains(normalizedQuery);
    }); */
    if (hashtags.value.isEmpty) return const SizedBox.shrink();

    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: const Color(0xFFE9EAF4),
            child: ListTile(
              dense: true,
              horizontalTitleGap: 0,
              title: Text("'$query'"),
            ),
          ),
          const Divider(height: 0),
          LimitedBox(
            maxHeight: MediaQuery.of(context).size.height * 0.3,
            child: ListView.separated(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: hashtags.value.length,
                  separatorBuilder: (_, __) => const Divider(height: 0),
                  itemBuilder: (context, i) {
                    final hashtag = hashtags.value.elementAt(i);
                    return ListTile(
                      dense: true,
                      leading: CircleAvatar(
                        backgroundColor: const Color(0xFFF7F7F8),
                        backgroundImage: NetworkImage(
                          hashtag.image,
                          scale: 0.5,
                        ),
                      ),
                      title: Text('#${hashtag.name}'),
                      subtitle: Text(
                        hashtag.description,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onTap: () {
                        onHashtagTap(hashtag);
                        hashtags.value.removeAt(i);
                        
                      },
                    );
                  },
                ),
          ),
        ],
      ),
    );
  }
}