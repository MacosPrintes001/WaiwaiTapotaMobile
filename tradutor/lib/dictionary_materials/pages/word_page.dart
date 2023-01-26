import 'package:flutter/material.dart';

class WordPage extends StatefulWidget {
  const WordPage({
    super.key,
    required this.wordPort,
    required this.translationWaiwai,
    required this.category,
    required this.meaningPort,
    required this.meaningWaiwai,
    required this.synonymPort,
    required this.synonymWaiwai,
  });

  final String wordPort;
  final String translationWaiwai;
  final String category;
  final String meaningPort;
  final String meaningWaiwai;
  final String synonymPort;
  final String synonymWaiwai;
  //final ImageBitmap imagem;

  @override
  State<WordPage> createState() => _WordPageState();
}

class _WordPageState extends State<WordPage> {
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 30),

              const Image(image: AssetImage("assets/noImage.png")),

              const SizedBox(height: 40),

              //Titulo Portugues
              TextButton.icon(
                icon: const Icon(Icons.play_arrow),
                onPressed: () {},
                label: Text(widget.wordPort,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              //Descrição Portugues
              Card(
                color: const Color.fromARGB(255, 3, 172, 101).withOpacity(0.5),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    widget.meaningPort,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              //Titulo Waiwai
              TextButton.icon(
                icon: const Icon(Icons.play_arrow),
                onPressed: () {},
                label: Text(widget.translationWaiwai,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              //waiwai descrição
              Card(
                color: const Color.fromARGB(255, 3, 172, 101).withOpacity(0.5),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    widget.meaningWaiwai,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
