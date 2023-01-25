// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tradutor/dictionary_materials/services/api_folders.dart'
    as services;
import 'package:tradutor/system_pages/home_page.dart';
import 'package:tradutor/system_pages/login_page.dart';

//Pagina Para load de informações do banco

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  initState() {
    print("object");
    services.temUsuario().then((resposta) {
      if(resposta){
        print("TEM");
        //pegar tokens e logar
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      }else{
        print("NÂO TEM");
        //mandar usuario logar
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        );
      }
    },);
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(75, 0, 191, 165),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            //Imagem Logo aplicativo
            Image(
              image: AssetImage("assets/logo.png"),
              width: 300,
            ),
            SizedBox(height: 30),
            SpinKitWave(
              color: Color.fromARGB(75, 0, 191, 166),
            ),
          ],
        ),
      ),
    );
  }
}
