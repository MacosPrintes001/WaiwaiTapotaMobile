import 'package:flutter/material.dart';
import 'package:tradutor/dictionary_materials/models/model_dictionary.dart';
import 'package:tradutor/dictionary_materials/services/api_folders.dart';
import 'package:tradutor/dictionary_materials/utils/loading_widget.dart';
import 'package:tradutor/dictionary_materials/utils/word_tile.dart';

class DictHomePage extends StatefulWidget {
  const DictHomePage({super.key});

  @override
  State<DictHomePage> createState() => _DictHomePageState();
}

class _DictHomePageState extends State<DictHomePage> {
  final List<wordModel> _words = <wordModel>[];
  List<wordModel> _wordDisplay = <wordModel>[];

  bool _isLoading = true;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    fetchWords().then((value) {
      setState(() {
        _isLoading = false;
        _words.addAll(value);
        //criar arquivo json local com value para acessar offline
        _wordDisplay = _words;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(190, 0, 77, 40),
        elevation: 0.0,
        title: const Text("Dicionario", textAlign: TextAlign.left),
        actions: [
          //Botão para atualizar o dicionario local
          TextButton.icon(
            onPressed: () {
              //colocar função de atualizar só o listviwe
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const DictHomePage(),
                ),
              );
            },
            icon: const Icon(
              color: Colors.white,
              Icons.download,
            ),
            label: const Text(
              "update",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (context, index) {
            if (!_isLoading) {
              return index == 0
                  ? _searchBar()
                  : WordTile(
                      word: this._wordDisplay[index - 1],
                    );
            } else {
              return const LoadingView();
            }
          },
          itemCount: _wordDisplay.length + 1,
        ),
      ),
    );
  }

  _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
        autofocus: false,
        onChanged: (searchText) {
          searchText = searchText.toLowerCase();
          setState(() {
            _wordDisplay = _words.where((u) {
              var ptWord = u.wordPort.toLowerCase();
              var waiWord = u.translationWaiwai.toLowerCase();
              return ptWord.contains(searchText) ||
                  waiWord.contains(searchText);
            }).toList();
          });
        },
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.search),
          hintText: 'Buscar Palavras',
        ),
      ),
    );
  }
}
