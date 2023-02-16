import 'package:flutter/material.dart';
import 'package:tradutor/dictionary_materials/models/model_dictionary.dart';
import 'package:tradutor/dictionary_materials/services/api_folders.dart';

class WordPage extends StatefulWidget {
  final wordModel word;
  const WordPage({super.key, required this.word});

  @override
  State<WordPage> createState() => _WordPageState();
}

class _WordPageState extends State<WordPage> {
  var image = "assets/noImage.png";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWordData(widget.word.wodrId).then((value) {
      
    });
  }

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
                image: AssetImage(
                    "assets/noImage.png"), //mudar para imagem dinamica
                width: 300,
              ),
              const SizedBox(height: 22.0),
              TextButton.icon(
                icon: const Icon(Icons.mic),
                onPressed: () {}, //dar play no audio
                label: Text(
                  widget.word.wordPort,
                  style: const TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Text(
                widget.word.meaningPort.toString(),
                style: const TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.left,
              ),
              Text(
                widget.word.synonymPort,
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
                  widget.word.translationWaiwai,
                  style: const TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Text(
                widget.word.meaningWaiwai,
                style: const TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.left,
              ),
              Text(
                widget.word.synonymWaiwai,
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
