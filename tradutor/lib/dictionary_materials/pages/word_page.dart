import 'package:flutter/material.dart';

class WordPage extends StatefulWidget {

  const WordPage({super.key, required this.brWord, required this.waiWord, required this.brDescript, required this.waiDescript});

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
        title: const Text("Palavra"),
        elevation: 0.0,
        actions: [],
      ),
      body: Center(
        child: Column(
          children: [
            Column(
              children: [
                const SizedBox(height: 30,),
                Text(
                  widget.brWord.toString(),
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const Image(
                  image: AssetImage("assets/logo.png"),
                ),
                Text(
                  widget.waiWord,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Card(
              child: Container(
                width: 380,
                decoration: BoxDecoration(
                  color:
                      const Color.fromARGB(255, 1, 207, 122).withOpacity(0.25),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Pt-br",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: null,
                    ),
                    SizedBox(
                      width: 350,
                      child: Text(
                        widget.brDescript,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: Container(
                width: 380,
                decoration: BoxDecoration(
                  color:
                      const Color.fromARGB(255, 1, 207, 122).withOpacity(0.25),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Wai",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: null,
                    ),
                    SizedBox(
                      width: 350,
                      child: Text(
                        widget.waiDescript,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
