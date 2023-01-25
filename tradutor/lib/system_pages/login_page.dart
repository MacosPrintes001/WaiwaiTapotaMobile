// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tradutor/dictionary_materials/services/api_folders.dart';
import 'package:tradutor/system_pages/registration_page.dart';
import 'package:http/http.dart' as http;

//Tela de login de usuário
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  final _emaiController = TextEditingController();
  final _senhaController = TextEditingController();
  bool verSenha = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 77, 64),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //LOGO
                const Image(
                  image: AssetImage('assets/logo.png'),
                  height: 200,
                ),
                //TITLE
                Text(
                  "Waiwai Translator",
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 42,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                //EMAIL TEXT FIELD
                TextFormField(
                  controller: _emaiController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    label: Text('e-mail'),
                    hintText: 'eduardo@email.com',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  validator: (email) {
                    if (email == null || email.isEmpty) {
                      return 'Digite seu email';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                //SENHA TEXT FIELD
                TextFormField(
                  controller: _senhaController,
                  obscureText: !verSenha,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(verSenha ?  Icons.visibility_off_outlined : Icons.visibility_outlined),
                      onPressed: () {
                        setState(() {
                          verSenha = !verSenha;
                        });
                      },
                    ),
                    label: const Text('senha'),
                    hintText: 'Digite sua senha',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  validator: (senha) {
                    if (senha == null || senha.isEmpty) {
                      return 'Digite uma senha';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                //BOTÂO LOGAR
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(84, 11, 214, 108),
                      minimumSize: const Size(40, 40)),
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                       http.Response response = await login(_emaiController.text, _senhaController.text, context);
                       print(response.body);
                    }
                  },
                  child: const Text(
                    "ENTRAR",
                    style: TextStyle(fontSize: 18),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                //REGISTRAR AGORA
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Não tem conta?",
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontWeight: FontWeight.bold), //GoogleFonts
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const RegistrationPage();
                        }));
                      },
                      child: Text(
                        " Registrar Agora",
                        style: GoogleFonts.roboto(
                            color: Colors.lightBlue,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
