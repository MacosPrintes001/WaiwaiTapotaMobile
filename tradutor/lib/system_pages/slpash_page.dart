import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tradutor/dictionary_materials/models/util.dart' as util;
import 'login_page.dart';

//Pagina Para load de informações do banco

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Future<void> initState() async {
    super.initState();

    //Pegando dicionario
    await util.getDictionary(context);
    
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
            Text(
              "Updating Dictionary...",
              style: TextStyle(color: Colors.white),
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
