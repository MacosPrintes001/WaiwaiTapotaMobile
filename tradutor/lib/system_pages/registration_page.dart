// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tradutor/dictionary_materials/services/api_folders.dart';

import 'login_page.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({
    Key? key,
  }) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {

  final _formkey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _emaiController = TextEditingController();
  final _senhaController = TextEditingController();
  final _confirSenhaController = TextEditingController();

  bool _passWordConfirmed() {
    if (_senhaController.text.trim() == _confirSenhaController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  signUp() {
    if (_passWordConfirmed()) {
      Cadastro(context, _senhaController.text, _userNameController.text,_emaiController.text);
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text('SENHAS NÂO COINCIDEM'),
            );
          });
    }
  }

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
                //USER TEXT FIELD
                TextFormField(
                  controller: _userNameController,
                  decoration: const InputDecoration(
                    label: Text('Nome de usuario'),
                    hintText: 'Eduardo Silva',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  validator: (email) {
                    if (email == null || email.isEmpty) {
                      return 'Digite um nome de usuario';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                //EMAIL TEXT FIELD
                TextFormField(
                  controller: _emaiController,
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
                  decoration: const InputDecoration(
                    label: Text('senha'),
                    hintText: 'Digite uma senha',
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
                //Confirm SENHA TEXT FIELD
                TextFormField(
                  controller: _confirSenhaController,
                  decoration: const InputDecoration(
                    label: Text('Confirme sua senha'),
                    hintText: 'Digite uma senha',
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
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      signUp();
                    }
                  },
                  child: const Text(
                    "CADASTRAR",
                    style: TextStyle(fontSize: 18),
                  ),
                ),

                //REGISTRAR AGORA
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Já tem conta?",
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontWeight: FontWeight.bold), //GoogleFonts
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const LoginPage();
                        }));
                      },
                      child: Text(
                        "Logar Agora",
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
