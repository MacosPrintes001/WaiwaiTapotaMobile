// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../system_pages/slpash_page.dart';

Future setLogin(http.Response response,
    String senha, String usuario) async {
  final prefs = await SharedPreferences.getInstance();
  //login aceito
  var accessToken = jsonDecode(response.body)['access_token'];

  await prefs.setString('token', accessToken.toString());
  await prefs.setString('user', usuario.toString().toLowerCase());
  await prefs.setString('senha', senha.toString());

  return true;

}
