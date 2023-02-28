import 'package:audioplayers/audioplayers.dart';
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
  AudioPlayer player = AudioPlayer();

  var imageErro = "assets/noImage.png";
  var url = urlbase;
  // ignore: prefer_typing_uninitialized_variables
  var imageId, audioId;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    getWordData(widget.word.wodrId).then((value) {
      if (value['image'] != null) {
        setState(() {
          imageId = value['image'];
        });

        setState(() {
          imageId = value['image'];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(166, 51, 41, 1),
        centerTitle: true,
        title: const Text("Significado"),
        elevation: 0.0,
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 16.0),
            Center(
              child: Column(
                children: [
                  //Imagem
                  Image.network(
                    "$url/uploads/$imageId",
                    scale: 3,
                    errorBuilder: (context, error, stackTrace) {
                      return Image(image: AssetImage(imageErro));
                    },
                  ),
                  const SizedBox(height: 20),
                  //Titulo Waiwai
                  Text(
                    widget.word.meaningWaiwai.toString().toUpperCase(),
                    style: const TextStyle(
                      fontFamily: "RobotoMono",
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            //Significados
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Significado Portuges
                    Row(
                      children: [
                        Expanded(
                          child: RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                              style: const TextStyle(
                                fontSize: 28,
                                color: Colors.black,
                              ),
                              children: <TextSpan>[
                                const TextSpan(
                                    text: "Significado: ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(
                                  text: widget.word.meaningPort,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                              children: <TextSpan>[
                                const TextSpan(
                                    text: "Fonema: ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(
                                  text: widget.word.fonema,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                              children: <TextSpan>[
                                const TextSpan(
                                    text: "Sinonimo Pt: ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(
                                  text: widget.word.synonymPort,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                              children: <TextSpan>[
                                const TextSpan(
                                    text: "Sinonimo Wai: ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(
                                  text: widget.word.synonymWaiwai,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),

                    Row(
                      children: [
                        Expanded(
                          child: RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                              children: <TextSpan>[
                                const TextSpan(
                                    text: "Comentário: ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(
                                  text: widget.word.exampleSentence,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
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
