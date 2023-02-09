import 'package:flutter/material.dart';
import 'system_pages/slpash_page.dart';
import 'dictionary_materials/pages/dict_home_page.dart';


//Função principal Flutter
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DictHomePage(),
    );
  }
}
