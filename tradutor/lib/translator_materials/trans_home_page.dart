import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tradutor/system_pages/home_page.dart';

class TransHomePage extends StatefulWidget {
  const TransHomePage({Key? key}) : super(key: key);

  @override
  State<TransHomePage> createState() => _TransHomePageState();
}

class _TransHomePageState extends State<TransHomePage> {
  callDictionaryPage() {
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Translator"),
          elevation: 0.0,
          backgroundColor: Colors.green[700]),
      //menu appbar
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            const DrawerHeader(child: Icon(Icons.home_filled)),
            ListTile(
              leading: const Icon(Icons.translate),
              title: const Text("T R A D U T O R"),
              onTap: () {}, // ENVIA PARA A PAGINA DE TRADUÇÃO
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text("D I C I O N A R I O"),
              onTap: callDictionaryPage, // enviar para
            ),
            ListTile(
                leading: const Icon(Icons.logout),
                title: const Text("L O G O U T"),
                onTap: () {}),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(75, 0, 191, 165),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
              image: AssetImage("assets/logo.png"),
              width: 300,
            ),
            Text(
              "TRABALHANDO NESTA TELA",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
