import 'package:flutter/material.dart';
import 'package:tradutor/dictionary_materials/components/translate_text.dart';

import '../components/choose_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color.fromARGB(255, 0, 77, 64),
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
        //backgroundColor: const Color.fromARGB(255, 0, 77, 64),
        elevation: 0.0,
      ),
      
      body: Column(
        children: const <Widget>[
          ChooseLanguage(),
          TranslateText(),
        ]
      )
    );
  }
}
