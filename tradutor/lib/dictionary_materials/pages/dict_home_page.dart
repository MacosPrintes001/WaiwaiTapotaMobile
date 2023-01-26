//PAGINA PRINCIPAL DICIONARIO
import 'package:flutter/material.dart';
import 'package:tradutor/dictionary_materials/models/model_dictionary.dart';
import 'word_page.dart';

class DictHomePage extends StatefulWidget {
  const DictHomePage({
    super.key,
  });

  @override
  State<DictHomePage> createState() => _DictHomePageState();
}

class _DictHomePageState extends State<DictHomePage> {

  //Get WORDS
  
  //Criando Lista com valores estaticos, mudar para dinamico quando tiver API
  static List<wordModel> main_words_list = [
    wordModel(
      category: 'asdasd',
      wordPort: 'asdasd',
      meaningPort: 'asdasd',
      synonymPort: 'asdasd',
      translationWaiwai: 'asdasd',
      meaningWaiwai: 'asdasd',
      synonymWaiwai: 'asdasdasd',
    ),
    wordModel(
      category: 'asdasd',
      wordPort: 'asdasd',
      meaningPort: 'asdasd',
      synonymPort: 'asdasd',
      translationWaiwai: 'asdasd',
      meaningWaiwai: 'asdasd',
      synonymWaiwai: 'asdasdasd',
    ),
    wordModel(
      category: 'asdasd',
      wordPort: 'asdasd',
      meaningPort: 'asdasd',
      synonymPort: 'asdasd',
      translationWaiwai: 'asdasd',
      meaningWaiwai: 'asdasd',
      synonymWaiwai: 'asdasdasd',
    ),
    wordModel(
      category: 'asdasd',
      wordPort: 'asdasd',
      meaningPort: 'asdasd',
      synonymPort: 'asdasd',
      translationWaiwai: 'asdasd',
      meaningWaiwai: 'asdasd',
      synonymWaiwai: 'asdasdasd',
    ),
  ];

  List<wordModel> _display_list = List<wordModel>.from(main_words_list);

  List<wordModel> get display_list => _display_list;

  set display_list(List<wordModel> value) {
    _display_list = value;
  }

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
          //Botão para atualizar o dicionario local
          TextButton.icon(
            onPressed: () {},
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
            //Campo de busca de palavras
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
                itemBuilder: (BuildContext context, int index) => ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WordPage(
                          category: display_list[index].category.toString(),
                          wordPort: display_list[index].category.toString(),
                          meaningPort: display_list[index].category.toString(),
                          synonymPort: display_list[index].category.toString(),
                          translationWaiwai:
                              display_list[index].category.toString(),
                          meaningWaiwai:
                              display_list[index].category.toString(),
                          synonymWaiwai:
                              display_list[index].category.toString(),
                        ),
                      ),
                    );
                  },
                  contentPadding: const EdgeInsets.all(8.0),
                  title: Text(
                    display_list[index].wordPort!,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(display_list[index].translationWaiwai!),
                  //trailing: Text(dtime.toString()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
