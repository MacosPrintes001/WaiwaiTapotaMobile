import 'package:flutter/material.dart';

class WordPage extends StatefulWidget {
  const WordPage({super.key, });

  @override
  State<WordPage> createState() => _WordPageState();
}

class _WordPageState extends State<WordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: []),
      body: const Center(child: Text("Sua Palavra aparecerá aqui")),
    );
  }
}