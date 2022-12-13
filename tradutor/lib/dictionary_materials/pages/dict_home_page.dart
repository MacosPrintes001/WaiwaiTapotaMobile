// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:tradutor/dictionary_materials/models/model_dictionary.dart';
import 'word_page.dart';

class DictHomePage extends StatefulWidget {
  const DictHomePage({super.key});

  @override
  State<DictHomePage> createState() => _DictHomePageState();
}

class _DictHomePageState extends State<DictHomePage> {
  static List<WordModel> main_words_list = [
    WordModel("Macaco", "waiMacaco", "Nome comum a todos os símios ou primatas antropoides, exceto o homem. ", "Lorem ipsum dolor sit amet. Aut eligendi natus ut rerum animi cum"),
    WordModel("Verde", "waiVerde", "É verde", "wai Verde"),
    WordModel("Melão", "waiMelao", "É Fruta", "wai Fruta"),
    WordModel("Janero", "waiJanero", "É mês", "Wai Mes"),
    WordModel("Computador", "waiComputador", "É computador", "Wai Computador"),
    WordModel("Celular", "waiCelular", "É celular", "Wai celular"),
    WordModel("Caderno", "waiCaderno", "É caderno", "Wai Caderno"),
    WordModel("Macaco", "waiMacaco", "É macaco", "wai Macaco"),
    WordModel("Verde", "waiVerde", "É verde", "wai Verde"),
    WordModel("Melão", "waiMelao", "É Fruta", "wai Fruta"),
    WordModel("Janero", "waiJanero", "É mês", "Wai Mes"),
    WordModel("Computador", "waiComputador", "É computador", "Wai Computador"),
    WordModel("Celular", "waiCelular", "É celular", "Wai celular"),
    WordModel("Caderno", "waiCaderno", "É caderno", "Wai Caderno"),
  ];

  List<WordModel> display_list = List.from(main_words_list);

  void updateList(String value) {
    setState(() {
      display_list = main_words_list
          .where((element) =>
              element.brWord!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  //final dtime =  DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(

        backgroundColor: const Color.fromARGB(190, 0, 77, 40),
        title: const Text("Dicionario"),
        elevation: 0.0,
        actions: [
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(
              color: Colors.white,
              Icons.replay_outlined,
            ),
            label: const Text(
              "update",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Busque uma palavra",
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextField(
              onChanged: (value) => updateList(value),
              //style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[50],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                hintText: "Ex: Macaco",
                prefixIcon: const Icon(Icons.search),
                //prefixIconColor: ,
              ),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: ListView.builder(
                itemCount: display_list.length,
                itemBuilder: ((context, index) => ListTile(
                      onTap: (() {
                        //madar pra outra tela com informações
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WordPage(
                              brWord: display_list[index].brWord.toString(),
                              waiWord: display_list[index].waiWord.toString(),
                              brDescript:display_list[index].brDescription.toString(),
                              waiDescript: display_list[index].WaiDescription.toString(),
                            ),
                          ),
                        );
                      }),
                      contentPadding: const EdgeInsets.all(8.0),
                      title: Text(
                        display_list[index].waiWord!,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        display_list[index].brWord!,
                      ),
                      //trailing: Text(dtime.toString()),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
