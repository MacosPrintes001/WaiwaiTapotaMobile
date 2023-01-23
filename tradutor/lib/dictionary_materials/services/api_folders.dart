// ignore_for_file: depend_on_referenced_packages

import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:tradutor/dictionary_materials/utils/util.dart';
import 'package:tradutor/system_pages/home_page.dart';
import 'package:tradutor/system_pages/login_page.dart';
import 'package:http/http.dart' as http;

const urlbase = 'http://localhost:5000';

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

  // Future.delayed(const Duration(seconds: 4)).then((value) {
  //   Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => const LoginPage(),
  //       ));
  // });
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

Future login(usuario, senha, context) async {
  //print('ola ${usuario.text} ${senha.text}');
  //do login
  //usuario.text  senha.text

  try {
    var url = Uri.https(urlbase.toString(), '/auth/login');
    //var url = Uri.https('www.googleapis.com', '/books', {'q': '{http}'});

    // Await the http get response, then decode the json-formatted response.
    var response = await http.post(url,
        body: {"email": "junior3@gmail.com", "password": "junior123"});
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      var itemCount = jsonResponse['totalItems'];
      print('Number of books about http: $itemCount.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    //var response = await client.post(Uri.https(urlbase, '/auth/login',),body: {"email": "$usuario", "password": "$senha"});
    //var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    //var uri = Uri.parse(decodedResponse['uri'] as String);
    //print(await client.get(uri));

  } catch (e) {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: Text("Erro"),
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
