// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tradutor/dictionary_materials/models/model_dictionary.dart';
import 'package:http/http.dart' as http;
import 'package:tradutor/dictionary_materials/utils/util.dart';
import 'package:tradutor/system_pages/splash_page.dart';

String urlbase = 'https://waiwaitapota.homes';

Future updateWords(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  final String? accessToken = prefs.getString('token');

  try {
    var registerUrl = Uri.parse("$urlbase/palavras?limit=7000");
    final http.Response response = await http.get(
      registerUrl,
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json; charset=UTF-8'
      },
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);

      await prefs.setString('dicionario', jsonData.toString());

      return compute(parseWord, jsonData);
    } else if (response.statusCode == 401 || response.statusCode == 422) {
      String? email = prefs.getString('user');
      String? senha = prefs.getString('senha');
      var newResp = await login(email!, senha!);
      if (newResp.statusCode == 200) {
        bool resp = await setLogin(newResp, senha, email);
        if (resp) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text(
                "Token expirou, reconectanto",
              ),
              behavior: SnackBarBehavior.floating,
            ),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const SplashPage(),
            ),
          );
        }
      }
    }
  } catch (err) {
    return null;
  }
}

List<wordModel> parseWord(Map<String, dynamic> jsonMap) {
  var dicio = jsonMap['data'];
  var list = dicio as List<dynamic>;
  var words = list.map((e) => wordModel.fromJson(e)).toList();
  return words;
}

Future fetchWords(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  final String? accessToken = prefs.getString('token');
  final String? dicionarioOff = prefs.getString('dicionario');

  try {
    if (dicionarioOff != null) {
      Map<String, dynamic> jsonData = jsonDecode(dicionarioOff);

      return compute(parseWord, jsonData);
    } else {
      var registerUrl = Uri.parse("$urlbase/palavras?limit=7000");
      final http.Response response = await http.get(
        registerUrl,
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = jsonDecode(response.body);
        await prefs.setString('dicionario', jsonData.toString());
        return compute(parseWord, jsonData);
      } else if (response.statusCode == 401 || response.statusCode == 422) {
        String? email = prefs.getString('user');
        String? senha = prefs.getString('senha');
        var newResp = await login(email!, senha!);
        if (newResp.statusCode == 200) {
          bool resp = await setLogin(newResp, senha, email);
          if (resp) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.redAccent,
                content: Text(
                  "Token expirou, reconectanto",
                ),
                behavior: SnackBarBehavior.floating,
              ),
            );
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const SplashPage(),
              ),
            );
          }
        }
      }
    }
  } catch (err) {
    return null;
  }
}

Future getImage(id) async {
  final prefs = await SharedPreferences.getInstance();
  final String? accessToken = prefs.getString('token');

  var imgUrl = Uri.parse("$urlbase/palavras/$id");
  try {
    final http.Response response = await http.get(
      imgUrl,
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json; charset=UTF-8'
      },
    );
    if (response.statusCode == 200) {
      var word = json.decode(response.body);
      if (word['image'] != null) {
        var resImge =
            await http.get(Uri.parse("$urlbase/uploads/${word['image']}"));

        if (resImge.statusCode == 200) {
          final bytes = resImge.bodyBytes;
          final image = base64Decode(base64Encode(bytes));
          return image;
        }
      } else {
        return null;
      }
    }
  } catch (err) {
    return 404;
  }

  throw Exception();
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

Future login(String email, String senha) async {
  try {
    var loginUrl = Uri.parse("$urlbase/auth/login");
    var user = loginModel(email: email.toLowerCase(), password: senha);
    var response = await http.post(
      loginUrl,
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(user),
    );

    return response;
  } catch (err) {
    return null;
  }
}

Future getAudio(id) async {
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
    if (word['audio'] != null) {
      return word['audio'];
    } else {
      return null;
    }
  }
}

Future logoutUser(accessToken) async {
  try {
    var logoutUrl = Uri.parse("$urlbase/logout");
    final http.Response response = await http.delete(
      logoutUrl,
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json; charset=UTF-8'
      },
    );
    return response;
  } catch (err) {
    return null;
  }
}
