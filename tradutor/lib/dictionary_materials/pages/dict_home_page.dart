import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tradutor/system_pages/home_page.dart';

class DictHomePage extends StatefulWidget {
  const DictHomePage({super.key});

  @override
  State<DictHomePage> createState() => _DictHomePageState();
}

class _DictHomePageState extends State<DictHomePage> {
  caliga() {
    Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (ctx) => const HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text("Dicionário"),
            actions: const []),
        body: Center(
          child: TextButton(
            onPressed: caliga,
            child: const Text("Voltar"),
          ),
        ));
  }
}
