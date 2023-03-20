// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      verificaUsuario().then(
        (temUsuario) {
          if (temUsuario) {
            //pegar tokens e logar
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          } else {
            //mandar usuario logar
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginPage(),
              ),
            );
          }
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage("assets/splashBack.png"))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              //Imagem Logo aplicativo
              Image(
                image: AssetImage("assets/tapotaLogoBranco.png"),
                width: 300,
              ),
              SizedBox(height: 30),
              SpinKitWave(
                color: Colors.redAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> verificaUsuario() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? repeat = prefs.getBool('repeat');

    if (repeat == false || repeat == null) {
      return false;
    } else {
      return true;
    }
  }
}
