// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tradutor/dictionary_materials/models/model_dictionary.dart';
import 'package:http/http.dart' as http;
import 'package:tradutor/dictionary_materials/utils/util.dart';
import 'package:tradutor/system_pages/splash_page.dart';

String urlbase = 'https://waiwaitapota.homes';

List<wordModel> parseWord(String responseBody) {
  var list = json.decode(responseBody) as List<dynamic>;
  var words = list.map((e) => wordModel.fromJson(e)).toList();
  return words;
}

Future<List<wordModel>> fetchWords(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  final String? accessToken = prefs.getString('token');

  var registerUrl = Uri.parse("$urlbase/palavras");
  final http.Response response = await http.get(
    registerUrl,
    headers: {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'application/json; charset=UTF-8'
    },
  );

  if (response.statusCode == 200) {
    return compute(parseWord, response.body);
  } else if (response.statusCode == 401 || response.statusCode == 422) {
    String? email = prefs.getString('user');
    String? senha = prefs.getString('senha');
    var newResp = await login(email!, senha!);
    if (newResp.statusCode == 200) {
      bool resp = await setLogin(newResp, senha, email);
      if (resp) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const SplashPage(),
          ),
        );
      }
    }
  }
  throw Exception(response.statusCode);
}

Future getWordData(id) async {
  final prefs = await SharedPreferences.getInstance();
  final String? accessToken = prefs.getString('token');

  var imgUrl = Uri.parse("$urlbase/palavras/$id");
  final http.Response response = await http.get(
    imgUrl,
    headers: {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'application/json; charset=UTF-8'
    },
    
  );

  if (response.statusCode == 200) {
    var word = json.decode(response.body);
    var resImge = await http.get(Uri.parse("$urlbase/uploads/${word['image']}"));
        
    if (resImge.statusCode == 200) {
      var data = {
        "audio": word['audio'],
        "image": word['image']
      };
      return data;
    }else{
      return null;
    }
  }
  return null;
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

Future<http.Response> login(String email, String senha) async {
  var loginUrl = Uri.parse("$urlbase/auth/login");

  var user = loginModel(email: email.toLowerCase(), password: senha);

  var response = await http.post(
    loginUrl,
    headers: {'Content-Type': 'application/json; charset=UTF-8'},
    body: jsonEncode(user),
  );

  return response;
}

Future<http.Response> logoutUser(accessToken) async {
  var logoutUrl = Uri.parse("$urlbase/logout");
  final http.Response response = await http.delete(
    logoutUrl,
    headers: {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'application/json; charset=UTF-8'
    },
  );
  return response;
}
