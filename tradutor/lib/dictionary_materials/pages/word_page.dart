import 'package:flutter/material.dart';
import 'package:tradutor/dictionary_materials/models/model_dictionary.dart';

class WordPage extends StatelessWidget {
  final wordModel word;
  const WordPage({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(190, 0, 77, 40),
        centerTitle: true,
        title: const Text("Significado"),
        elevation: 0.0,
        actions: [],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 16.0,),
            Center(
              
            )
          ],
        ),
      ),
    );
  }
}
