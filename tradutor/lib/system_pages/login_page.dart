import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tradutor/dictionary_materials/services/api_folders.dart';
import 'package:tradutor/system_pages/registration_page.dart';
import 'package:tradutor/system_pages/slpash_page.dart';

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
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(verSenha
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined),
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
                    } else if (senha.length < 6) {
                      return 'senha inválida';
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
                      try {
                        var response =
                            await login(_emaiController, _senhaController);
                        if (response.statusCode == 200) {
                          final prefs = await SharedPreferences.getInstance();
                          //login aceito
                          var accessToken =
                              jsonDecode(response.body)['access_token'];
                          var refreshToken =
                              jsonDecode(response.body)['refresh_token'];
                              print(accessToken);
                          await prefs
                              .setString('token', accessToken.toString())
                              .then((value) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SplashPage(),
                              ),
                            );
                          });
                        } else if (response.statusCode == 400) {
                          //login invalido
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.redAccent,
                              content: Text(
                                "EMAIL OU SENHA INVALIDOS",
                              ),
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        } else {
                          //api fora do ar
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.redAccent,
                              content: Text(
                                "API FORA DO AR",
                              ),
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.redAccent,
                            content: Text(
                              "SEM CONEXÃO COM INTERNET",
                            ),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      }
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
