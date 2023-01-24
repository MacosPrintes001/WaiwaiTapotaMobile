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
  bool _verSenha = false;
  bool _verSenhaConfirm = false;

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
                  obscureText: !_verSenha,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(_verSenha
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined),
                      onPressed: () {
                        setState(() {
                          _verSenha = !_verSenha;
                        });
                      },
                    ),
                    label: const Text('senha'),
                    hintText: 'Digite uma senha',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  validator: (senha) {
                    if (senha == null || senha.isEmpty) {
                      return 'Digite uma senha';
                    } else if (senha.length < 6) {
                      return 'Digite uma senha mais forte';
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
                  obscureText: !_verSenhaConfirm,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(_verSenhaConfirm
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined),
                      onPressed: () {
                        setState(() {
                          _verSenhaConfirm = !_verSenhaConfirm;
                        });
                      },
                    ),
                    label: const Text('Confirme sua senha'),
                    hintText: 'Digite uma senha',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  validator: (senha) {
                    if (senha == null || senha.isEmpty) {
                      return 'Digite uma senha';
                    }
                    if (_senhaController.text.trim() !=
                        _confirSenhaController.text.trim()) {
                      return 'Senhas Não Coincidem';
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
                      Cadastro(context, _senhaController, _userNameController,
                          _emaiController);
                    }
                  },
                  child: const Text(
                    "CADASTRAR",
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
                        " Logar Agora",
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
