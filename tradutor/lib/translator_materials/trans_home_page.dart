import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tradutor/dictionary_materials/dict_home_page.dart';


class TransHomePage extends StatefulWidget {
  const TransHomePage({Key? key}) : super(key: key);

  @override
  State<TransHomePage> createState() => _TransHomePageState();
}

class _TransHomePageState extends State<TransHomePage> {

  callDictionaryPage(){
    try{
      Navigator.of(context).pushReplacement(
      // ignore: prefer_const_constructors
      CupertinoPageRoute(builder: (ctx) =>   DictHomePage()));
    }catch(e){}

    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const  Text("Translator"),
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
              onTap: (){},// ENVIA PARA A PAGINA DE TRADUÇÃO
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text("D I C T I O N A R Y"),
              onTap:callDictionaryPage,// enviar para 
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("L O G O U T"),
              onTap: (){}
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(75, 0, 191, 165),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:const[
            Image(
              image: AssetImage("assets/logo.png"),
              width: 300,
            ),
            Text("WORKING ON THIS SCREEN",
            style: TextStyle(
              color: Colors.white
            ),
            ),
          ],
        ),
      ),
    );
  }
}