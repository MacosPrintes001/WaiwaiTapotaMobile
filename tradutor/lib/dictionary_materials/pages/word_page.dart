import 'package:flutter/material.dart';

class WordPage extends StatefulWidget {
  const WordPage(
      {super.key,
      required this.brWord,
      required this.waiWord,
      required this.brDescript,
      required this.waiDescript});

  final String brWord;
  final String waiWord;
  final String brDescript;
  final String waiDescript;
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
                label: Text(widget.brWord,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              //Descrição Portugues
              Card(
                color: const Color.fromARGB(255, 3, 172, 101).withOpacity(0.5),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    widget.brDescript,
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
                label: Text(widget.waiWord,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              //waiwai descrição
              Card(
                color: const Color.fromARGB(255, 3, 172, 101).withOpacity(0.5),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    widget.waiDescript,
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
