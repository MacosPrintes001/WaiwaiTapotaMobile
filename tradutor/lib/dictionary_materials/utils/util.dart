// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

Future setLogin(http.Response response, String senha, String usuario) async {
  final prefs = await SharedPreferences.getInstance();
  //login aceito
  var accessToken = jsonDecode(response.body)['access_token'];
  await prefs.remove('token');
  await prefs.remove('user');
  await prefs.remove('senha');
  await prefs.setBool('repeat', false);

  await prefs.setString('token', accessToken.toString());
  await prefs.setString('user', usuario.toString().toLowerCase());
  await prefs.setString('senha', senha.toString());
  await prefs.setBool('repeat', true);

  return true;
}
