// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tradutor/system_pages/home_page.dart';

import 'login_page.dart';

class RegistrationPage extends StatefulWidget {

  const RegistrationPage({Key? key, }) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {

  //text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPassword = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPassword.dispose();
    super.dispose();

  }

  bool _passWordConfirmed(){
    if(_passwordController.text.trim() == _confirmPassword.text.trim()){
        return true;
    } else{
      return false;
    }
  }

  Future signUp() async{
    if(_passWordConfirmed()){
      try{
        // await FirebaseAuth.instance.createUserWithEmailAndPassword(
        //   email: _emailController.text.trim(), 
        //   password: _passwordController.text.trim(),
        // );
        Navigator.of(context).push(CupertinoPageRoute(builder: (ctx) =>  const HomePage()));
      }catch(w){
        showDialog(
        context: context, 
        builder: (context){
          // ignore: prefer_const_constructors
          return AlertDialog(
            content: const Text(""),
          );
        }
      );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  const Color.fromARGB(255, 0, 77, 64),//Verde escuro 255, 0, 77, 64 // Verde Claro 75, 0, 191, 165 // Mais ou menos acor da professora 190, 0, 77, 64
      body:  SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                //Icon
                const Image(
                  image: AssetImage('assets/logo.png'),
                  width: 200,
                  ),

                //App Name
                Text(
                  "Waiwai Translator",
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 42,
                  ),
                ),
                const SizedBox(height: 10,),
                Text(
                  "Translating your will", 
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 24,
                    )
                  ),
                
          
                const SizedBox(height: 30,),
          
                //email textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _emailController,
                    decoration:  InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)
                      ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color.fromARGB(84, 11, 214, 108)),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    hintText: 'Email',
                    fillColor: Colors.grey[200],
                    filled: true,
                    ),
                  ),
                ),
          
                const  SizedBox(height: 10),
          
                //password textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration:  InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)
                        ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color.fromARGB(84, 11, 214, 108)),
                        borderRadius: BorderRadius.circular(12)
                      ),
                      hintText: 'Password',
                      fillColor: Colors.grey[200],
                      
                      filled: true,
                    ),
                  ),
                ),
                

                const  SizedBox(height: 10),

                //confirm password textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    obscureText: true,
                    controller: _confirmPassword,
                    decoration:  InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)
                        ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color.fromARGB(84, 11, 214, 108)),
                        borderRadius: BorderRadius.circular(12)
                      ),
                      hintText: 'Confirm Password',
                      fillColor: Colors.grey[200],
                      
                      filled: true,
                    ),
                  ),
                ),
          
                const SizedBox(height:  10),
          
                //sgin in button
                Padding( 
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: signUp,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration:  BoxDecoration(
                        color: const Color.fromARGB(84, 11, 214, 108),
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Center(
                        child:Text(
                          "Sign Up",
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                          ),//GoogleFonts
                        )
                      )
                    ),
                  ),
                ),

                const SizedBox(height: 25),
          
                //not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "I am a member!",
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),//GoogleFonts
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(CupertinoPageRoute(builder: (ctx) =>  const LoginPage()));
                      },
                      child: Text(
                        " Login now", 
                        style: GoogleFonts.roboto(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),//GoogleFonts
                      ),
                    )
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