import 'dart:typed_data';

import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:tradutor/dictionary_materials/models/model_dictionary.dart';
import 'package:flutter/material.dart';
import 'package:tradutor/dictionary_materials/services/api_folders.dart';


class WordPage extends StatefulWidget {
  final wordModel word;
  const WordPage({super.key, required this.word});

  @override
  State<WordPage> createState() => _WordPageState();
}

class _WordPageState extends State<WordPage> {
  var imageErro = "assets/noImage.png";
  var _imageUrl;
  String? _imageError;
  final player = AudioPlayer();

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();

    try {
      getImage(widget.word.wodrId).then((value) {
        if (value != null && value != 404) {
          setState(() {
            _imageUrl = value;
          });
        } else if (value == 404) {
          setState(() {
            _imageError =
                "⚠ Erro ao carregar imagem. \nVerifique sua conexão e tente novamente!";
          });
        } else {
          setState(() {
            _imageError =
                '⚠ Erro ao carregar imagem. \nEsta palavra não possui imagem ainda!';
          });
        }
      });
    } catch (err) {
      setState(() {
        _imageError = '⚠ Erro ao carregar imagem';
      });
    }
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            // Imagem centralizada
            Center(
              child: _imageUrl == null
                  ? Column(
                      children: [
                        if (_imageError != null)
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Image(image: AssetImage(imageErro)),
                              Positioned.fill(
                                child: Container(
                                  padding: const EdgeInsets.all(16.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.8),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Center(
                                    child: Text(
                                      _imageError.toString(),
                                      style: GoogleFonts.openSans(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        if (_imageError == null)
                          Column(
                            children: const [
                              CircularProgressIndicator(),
                              SizedBox(height: 16),
                              Text('Carregando imagem...')
                            ],
                          ),
                      ],
                    )
                  : Image.memory(
                      Uint8List.fromList(_imageUrl),
                      fit: BoxFit.cover,
                    ),
            ),

            // Título da imagem
            Center(
              child: TextButton.icon(
                icon: const Icon(Icons.spatial_audio_off),
                onPressed: () async {
                  var resp = await getAudio(widget.word.wodrId);

                  if (resp != null) {
                    await player.setUrl("$urlbase/uploads/$resp");
                    await player.play();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.redAccent,
                        content: Center(
                          child: Text(
                            "PALAVRA SEM AUDIO",
                          ),
                        ),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  }
                },
                label: Text(
                  widget.word.meaningWaiwai.toString().toUpperCase(),
                  style: GoogleFonts.openSans(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            //Descrição da palavra
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Significado
                  RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                        style: GoogleFonts.openSans(
                          fontSize: 22.0,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: "Significado: ",
                              style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                            text: widget.word.meaningPort,
                          ),
                        ]),
                  ),
                  //Fonema
                  RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      style: GoogleFonts.openSans(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: "Fonema: ",
                            style: GoogleFonts.openSans(
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                          text: widget.word.fonema,
                        ),
                      ],
                    ),
                  ),
                  //Sinonimo Pt-br
                  RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      style: GoogleFonts.openSans(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: "Sinonimo Pt: ",
                            style: GoogleFonts.openSans(
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                          text: widget.word.synonymPort,
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      style: GoogleFonts.openSans(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: "Sinonimo Wai: ",
                            style: GoogleFonts.openSans(
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                          text: widget.word.synonymWaiwai,
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      style: GoogleFonts.openSans(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: "Comentário: ",
                            style: GoogleFonts.openSans(
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                          text: widget.word.exampleSentence,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
