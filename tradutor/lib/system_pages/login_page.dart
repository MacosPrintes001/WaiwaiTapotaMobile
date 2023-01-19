import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';
import 'package:tradutor/system_pages/registration_page.dart';

import 'home_page.dart';

//Tela de login de usuário
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //definindo controladores para os campos que serão recebidos
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future signIn() async {
    try {
      //criar await login
      await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ));
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text("Email ou senha errados"),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 77,64), //Verde escuro 255, 0, 77, 64 // Verde Claro 75, 0, 191, 165 // Mais ou menos acor da professora 190, 0, 77, 64
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Icone
                const Image(
                  image: AssetImage('assets/logo.png'),
                  width: 200,
                ),

                //Nome da Aplicação
                Text(
                  "Waiwai Translator",
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 42,
                  ),
                ),

                const SizedBox(
                  height: 25,
                ),

                //campo de email
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(84, 11, 214, 108)),
                          borderRadius: BorderRadius.circular(12)),
                      hintText: 'Email',
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                //campo de senha
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(84, 11, 214, 108),),
                          borderRadius: BorderRadius.circular(12),),
                      hintText: 'Senha',
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                //RECUPERAR SENHA
                //Forgot Password
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children:  [
                //      GestureDetector(
                //       onTap: () {
                //         Navigator.push(
                //           context, MaterialPageRoute(
                //             builder: (context){
                //               return const ForgotPasswordPage();
                //             }
                //           )
                //         );
                //       },
                //        child: Text(
                //         "Forgot Password?",
                //         style: GoogleFonts.roboto(
                //           color: Colors.lightBlue,
                //           fontWeight: FontWeight.bold,
                //           fontSize: 15
                //         ),
                //        ),
                //      ),
                //     ],
                //   ),
                // ),

                const SizedBox(height: 10),

                //Botão logar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: signIn, //Colocar Função de sigin
                    child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(84, 11, 214, 108),
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                            child: Text(
                          "Sign In",
                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18), //GoogleFonts
                        ))),
                  ),
                ),

                const SizedBox(height: 25),

                //Registrar usuario
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
                        "Registrar Agora",
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
