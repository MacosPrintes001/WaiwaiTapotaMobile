// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:tradutor/dictionary_materials/models/model_dictionary.dart';
import 'package:http/http.dart' as http;

import '../utils/util.dart';

String urlbase = 'http://192.168.1.8:5000';

Future<bool> temUsuario() async {
  await Future.delayed(const Duration(seconds: 4)).then((value) {
    verificarUser().then((haveUser) {
      if (haveUser) {
        return true;
      } else {
        return false;
      }
    });
  });

  return false;
}

Future pegarDicionario(accessToken) async{
  var dicionarioUrl = Uri.parse("$urlbase/palavras");

  var response = await http.get(dicionarioUrl, headers: {
    'Authorization': 'Bearer $accessToken',
    'Content-Type': 'application/json; charset=UTF-8'
  });

  var dicionario = jsonDecode(response.body);
  print(response.body);
  return dicionario;
}

Future cadastro(senha, usuario, email) async {
  var registerUrl = Uri.parse("$urlbase/auth/register");

  var user = cadastroUserModel(
      email: email.text.toString().toLowerCase(),
      password: senha.text,
      username: usuario.text.toString().toLowerCase());

  var response = await http.post(registerUrl,
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(user));

  return response.statusCode;
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

Future logout(accessToken, refreshToken) async {
  print("$accessToken $refreshToken");
  var registerUrl = Uri.parse("$urlbase/logout");
  var response = await http.delete(registerUrl, headers: {
    'Content-Type': 'application/json; charset=UTF-8'
  }, body: {
    "access_token": accessToken,
    "refresh_token": refreshToken,
  });

  return response.statusCode;
}
