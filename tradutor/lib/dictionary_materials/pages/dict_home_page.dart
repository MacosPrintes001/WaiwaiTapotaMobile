import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tradutor/dictionary_materials/pages/word_page.dart';

class DictHomePage extends StatefulWidget {
  const DictHomePage({super.key});

  @override
  State<DictHomePage> createState() => _DictHomePageState();
}

class _DictHomePageState extends State<DictHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text("Dicionário"),
            actions: [
              IconButton(
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: CustomSearchDelegate(),
                    ) as Container;
                  },
                  icon: const Icon(Icons.search))
            ]),
        body: Center());
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTherms = [
    'Apple',
    'Banana',
    'Pear',
    'Watermelons',
    'oranges'
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var word in searchTherms) {
      if (word.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(word);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: ((context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
          onTap: (){
            Navigator.of(context).push(
            CupertinoPageRoute(builder: (ctx) => const WordPage(  )));//arrumar um jeito de mandar palavra pra nova tela
          }
        );
      }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var word in searchTherms) {
      if (word.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(word);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: ((context, index) {
        var result = matchQuery[index];
        return ListTile( 
          title: Text(result),
          onTap: (){
            Navigator.of(context).push(
            CupertinoPageRoute(builder: (ctx) => const WordPage()));
          }
        );
      }),
    );
  }
}
