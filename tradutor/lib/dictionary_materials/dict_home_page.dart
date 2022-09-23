import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tradutor/system_pages/login_page.dart';
import 'package:tradutor/translator_materials/trans_home_page.dart';

class DictHomePage extends StatefulWidget {
  const DictHomePage({Key? key}) : super(key: key);

  @override
  State<DictHomePage> createState() => _DictHomePageState();
}

class _DictHomePageState extends State<DictHomePage> {

  
  callTranslatorPage(){
    try{
      Navigator.of(context).push(
      CupertinoPageRoute(builder: (ctx) =>  const TransHomePage()));
    }catch(e){}
  }

  callDictionaryPage(){
    try{
    }catch(e){}
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dictionary"),
        elevation: 0.0,
      ),
      //menu appbar
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            const DrawerHeader(child: Icon(Icons.home_filled)),
            ListTile(
              leading: const Icon(Icons.translate),
              title: const  Text("T R A N S L A T O R"),
              onTap: callTranslatorPage,// ENVIA PARA A PAGINA DE TRADUÇÃO
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text("D I C T I O N A R Y"),
              onTap:callDictionaryPage,// enviar para 
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("L O G O U T"),
              onTap: (){
                Navigator.of(context).push(CupertinoPageRoute(builder: (ctx) =>  const LoginPage()));//logout
              }
            ),
          ],
        ),
      ),
    );
  }
}