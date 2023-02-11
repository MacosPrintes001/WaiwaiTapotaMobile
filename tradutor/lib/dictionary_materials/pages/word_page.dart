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
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 16.0),
              const Image(
                image: AssetImage("assets/noImage.png"),//mudar para imagem dinamica
                width: 300,
              ),
              const SizedBox(height: 22.0),
              TextButton.icon(
                icon: const Icon(Icons.mic),
                onPressed: () {}, //dar play no audio
                label: Text(
                  word.wordPort,
                  style: const TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Text(
                word.meaningPort.toString(),
                style: const TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.left,
              ),
              Text(
                word.synonymPort,
                style: const TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.left,
                
              ),
              TextButton.icon(
                icon: const Icon(Icons.mic),
                onPressed: () {}, //dar play no audio
                label: Text(
                  word.translationWaiwai,
                  style: const TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Text(
                word.meaningWaiwai,
                style: const TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.left,
              ),
              Text(
                word.synonymWaiwai,
                style: const TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
