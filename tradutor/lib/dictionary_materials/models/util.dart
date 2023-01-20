// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tradutor/system_pages/login_page.dart';

String urlBase = 'http://localhost:5000';

//var urlBase = Uri.parse('http://localhost:5000');
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

Future login(var usuario, var senha) async {
  //do login
  // var url = Uri.https(urlBase, '/auth/login/');
  // var response = await http.post(url, body: {"email": "junior3@gmail.com", "password": "junior123"});
}
