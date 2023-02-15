// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:tradutor/dictionary_materials/models/model_dictionary.dart';
import 'package:tradutor/dictionary_materials/pages/word_page.dart';


class WordTile extends StatelessWidget {
  final wordModel word;

  const WordTile({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          ListTile(
            title: Text(word.wordPort),
            subtitle: Text(word.translationWaiwai),
            onTap: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WordPage(word: word),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
