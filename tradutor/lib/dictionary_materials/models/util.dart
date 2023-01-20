// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tradutor/system_pages/login_page.dart';

var urlBase = Uri.http('http://localhost:5000');

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
  var barrer = Uri.http('$urlBase/auth/login');
  
  try {
    var response = await http.post(barrer, body: {'$usuario', '$senha'});
    print(response);
    return true;
  } catch (e) {
    return false;
  }

}
