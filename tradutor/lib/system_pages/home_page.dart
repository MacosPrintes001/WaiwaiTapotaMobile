//Tela onde vai ficar direcionador dicionario ou tradutor
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tradutor/dictionary_materials/pages/dict_home_page.dart';
import 'package:tradutor/dictionary_materials/services/api_folders.dart';
import 'package:tradutor/system_pages/login_page.dart';
import 'package:tradutor/system_pages/splash_page.dart';
import 'about_Equipe_page.dart';
import 'about_project_page.dart';

//Tela Para escolher Dicionario OU Tradutor
class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //Chamar dicionario
    callDict() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const DictHomePage(),
        ),
      );
    }

    aboutProject() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AboutProjectPage(),
        ),
      );
    }

    aboutComponets() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AboutEquipePage(),
        ),
      );
    }

    //Deslogar do sistema
    Future logout() async {
      final prefs = await SharedPreferences.getInstance();
      final String? accessToken = prefs.getString('token');

      await logoutUser(accessToken).timeout(
        const Duration(seconds: 5),
        onTimeout: () {
          return ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text(
                "ERRO, VERIFIQUE SUA CONEXÃO E TENTE NOVAMENTE",
              ),
              behavior: SnackBarBehavior.floating,
            ),
          );
        },
      ).then((value) {
        if (value == null) {
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text(
                "ERRO, VERIFIQUE SUA CONEXÃO E TENTE NOVAMENTE",
              ),
              behavior: SnackBarBehavior.floating,
            ),
          );
        } else {
          if (value.statusCode == 200) {
            prefs.clear();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const SplashPage(),
              ),
            );
          }
        }
      });
    }

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,

        //Welcome text
        title: const Text("Bem Vindo(a)"),
        backgroundColor: const Color.fromRGBO(166, 51, 41, 1),
      ),

      //Side Bar
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              child: Icon(Icons.home),
            ),

            //SideBar Buttons
            TextButton.icon(
              onPressed: callDict,
              icon: const Icon(
                Icons.menu_book_rounded,
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
            TextButton.icon(
              onPressed: aboutProject,
              icon: const Icon(
                Icons.info,
              ),
              label: const Text('Sobre Projeto'),
            ),
            TextButton.icon(
              onPressed: aboutComponets,
              icon: const Icon(
                Icons.supervised_user_circle_sharp,
              ),
              label: const Text('Sobre Integrantes'),
            ),
          ],
        ),
      ),

      //App Body
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Ink(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(166, 51, 41, 1),
                shape: BoxShape.rectangle,
              ),

              //Botão central chamar dicionario
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
            //Botão Central Tradutor
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
