// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

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
  var user =
      cadastroUserModel(email: email, username: usuario, password: senha);
  var url = Uri.parse("$urlbase/auth/register");
  var response = await http.post(url,
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: user.toJson());

  if (response.statusCode == 201) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text(
          "CADASTRO FALHOU",
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

Future login(email, senha, context) async {
  try {
    http.post(
      Uri.parse('http://localhost:5000/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "email": email,
        "password": senha,
      }),
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text(
          "ERRO NO CODIGO",
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
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
