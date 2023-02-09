// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tradutor/dictionary_materials/models/model_dictionary.dart';
import 'package:http/http.dart' as http;

String urlbase = 'http://192.168.1.8:5000'; // UFOPA


List<wordModel> parseWord(String responseBody){
  var list = json.decode(responseBody) as List<dynamic>;
  var words = list.map((e) => wordModel.fromJson(e)).toList();
  return words;
}

Future<List<wordModel>> fetchWords() async {
  
  final prefs = await SharedPreferences.getInstance();
  final String? accessToken = prefs.getString('token');

  var registerUrl = Uri.parse("$urlbase/palavras");
  var response = await http.get(
    registerUrl,
    headers: {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'application/json; charset=UTF-8'
    },
  );

  if (response.statusCode == 200) {
    return compute(parseWord, response.body);
  } else {
    throw Exception(response.statusCode);
  }
}

Future<http.Response> cadastro(senha, usuario, email) async {
  var registerUrl = Uri.parse("$urlbase/auth/register");

  var user = cadastroUserModel(
    email: email.text.toString().toLowerCase(),
    password: senha.text,
    username: usuario.text.toString().toLowerCase(),
  );

  var response = await http.post(registerUrl,
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(user));
  return response;
}

Future<http.Response> login(email, senha) async {
  var loginUrl = Uri.parse("$urlbase/auth/login");

  var user = loginModel(
      email: email.text.toString().toLowerCase(), password: senha.text);

  var response = await http.post(
    loginUrl,
    headers: {'Content-Type': 'application/json; charset=UTF-8'},
    body: jsonEncode(user),
  );

  return response;
}

Future logoutUser() async {
  final prefs = await SharedPreferences.getInstance();
  final String? accessToken = prefs.getString('token');

  var registerUrl = Uri.parse("$urlbase/logout");
  var response = await http.delete(
    registerUrl,
    headers: {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'application/json; charset=UTF-8'
    },
  ).then(
    (value) async {
      final success = await prefs.remove('token');
    },
  );
  //print('${response.body} /n ${response.statusCode} logout');
}
