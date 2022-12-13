//Tela onde vai ficar direcionador dicionario ou tradutor
import 'package:flutter/material.dart';
import 'package:tradutor/dictionary_materials/pages/dict_home_page.dart';
import 'package:tradutor/system_pages/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    callDict() {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DictHomePage(),
          ));
    }

    logout() {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ));
    }

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Bem Vindo(a)"),
        backgroundColor: const Color.fromARGB(190, 0, 77, 40),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              child: Icon(Icons.home),
            ),
            TextButton.icon(
              onPressed: callDict,
              icon: const Icon(
                Icons.book,
              ),
              label: const Text('Dicionario'),
            ),
            TextButton.icon(
              onPressed: null,
              icon: const Icon(
                Icons.translate_rounded,
              ),
              label: const Text('Tradutor'),
            ),
            TextButton.icon(
              onPressed: logout,
              icon: const Icon(
                Icons.logout,
              ),
              label: const Text('Logout'),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Ink(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.green[900],
                shape: BoxShape.rectangle,
              ),
              child: InkWell(
                onTap: callDict,
                child: const Icon(
                  Icons.menu_book_rounded,
                  size: 50,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Ink(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.rectangle,
              ),
              child: const InkWell(
                onTap: null,
                child: Icon(
                  Icons.translate_rounded,
                  size: 50,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
