// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tradutor/system_pages/login_page.dart';
import 'package:http/http.dart' as http;

import '../../system_pages/home_page.dart';

const urlbase = 'http://localhost:5000';

Future getDictionary(context) async {
  //Await Get Dictionary
  Future.delayed(const Duration(seconds: 4)).then((value) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ));
  });
}

Future login(usuario, senha, context) async {
  //print('ola ${usuario.text} ${senha.text}');
  //do login
  try {
    final response = await http.post(
      Uri.parse('$urlbase/auth/login'),
      body: jsonEncode(<String, String>{
        "email": "junior3@gmail.com",
        "password": "junior123"
      }),
    );

    if (response.statusCode == 201) {
      print("Ola Tudo certo");
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ));
      return true;
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text("Email ou senha invalidos"),
            );
          });
      print("Ola deu ruim");
      return false;
    }
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

Future logout(context) async{
  try{
    //var response = await http.delete(Uri.parse('$urlbase/logout'));
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ));
  }catch(e){
    showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text('erro'),
            );
          });
  }
}
