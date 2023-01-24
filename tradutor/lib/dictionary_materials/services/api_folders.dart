// ignore_for_file: depend_on_referenced_packages


import 'package:flutter/material.dart';
import 'package:tradutor/dictionary_materials/models/model_dictionary.dart';
import 'package:tradutor/dictionary_materials/utils/util.dart';
import 'package:tradutor/system_pages/home_page.dart';
import 'package:tradutor/system_pages/login_page.dart';
import 'package:http/http.dart' as http;

String urlbase = 'http://localhost:5000';

Future getDictionary(context) async {
  Future.delayed(const Duration(seconds: 4)).then((value) {
    verificarUser().then((haveUser) {
      if (haveUser) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        );
      }
    });
  });
}

Future Cadastro(context, senha, usuario, email) async {
  print("CADASTRSDO");
  // var client = http.Client();
  // try {
  //   var response = await client.post(Uri.https(urlbase, '/auth/register'),
  //       body: {'name': 'doodle', 'color': 'blue'});
  //   var decodedResponse =
  //       convert.jsonDecode(convert.utf8.decode(response.bodyBytes)) as Map;
  //   var uri = Uri.parse(decodedResponse['uri'] as String);
  //   print(await client.get(uri));
  // } finally {}
}

Future login(email, senha, context) async {
  //print('ola ${usuario.text} ${senha.text}');
  //do login
  //usuario.text  senha.text

  try {
    
    var usuario = loginModel(email: email.text.toString(), password: senha.text.toString());
    print("USUARIO CRIADO  ${usuario.toJson()}");
    var url = Uri.parse('${urlbase.toString()}/auth/login');
    print("URL CRIADA ${url}");

    

    // print(response.body);
    // print(response.statusCode);

  } catch (e) {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: Text("ERRO NO CODIGO"),
          );
        });
  }
}

Future logout(context) async {
  try {
    //var response = await http.delete(Uri.parse('$urlbase/logout'));
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ));
  } catch (e) {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: Text('erro'),
          );
        });
  }
}
