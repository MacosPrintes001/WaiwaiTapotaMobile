// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tradutor/dictionary_materials/services/api_folders.dart';
import 'package:tradutor/dictionary_materials/utils/util.dart';
import 'package:tradutor/system_pages/registration_page.dart';
import 'package:tradutor/system_pages/splash_page.dart';

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
    Color alertColor = Colors.orange;
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage("assets/backGroud.png"))),
        child: Scaffold(
          backgroundColor: Colors.transparent,
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
                      image: AssetImage('assets/tapotaLogo.png'),
                      height: 180,
                    ),
                    //TITLE
                    // Text(
                    //   "Waiwai Translator",
                    //   style: GoogleFonts.roboto(
                    //     color: Colors.white,
                    //     fontWeight: FontWeight.bold,
                    //     fontSize: 42,
                    //   ),
                    //   textAlign: TextAlign.center,
                    // ),
                    const SizedBox(
                      height: 80,
                    ),
                    //EMAIL TEXT FIELD
                    TextFormField(
                      controller: _emaiController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        errorStyle: TextStyle(color: alertColor),
                        label: const Text('e-mail'),
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
                        errorStyle: TextStyle(color: alertColor),
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
                          backgroundColor: Colors.black,
                          minimumSize: const Size(40, 40)),
                      onPressed: () async {
                        if (_formkey.currentState!.validate()) {
                          try {
                            var response = await login(
                                _emaiController.text.toString(),
                                _senhaController.text.toString());
                            if (response.statusCode == 200) {
                              bool resp = await setLogin(response,
                                  _senhaController.text, _emaiController.text);
                              if (resp) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SplashPage(),
                                  ),
                                );
                              }
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
        ),
      ),
    );
  }
}
