import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tradutor/system_pages/login_page.dart';
import 'package:tradutor/translator_materials/trans_home_page.dart';
import 'package:google_fonts/google_fonts.dart';

class DictHomePage extends StatefulWidget {
  const DictHomePage({Key? key}) : super(key: key);

  @override
  State<DictHomePage> createState() => _DictHomePageState();
}


class _DictHomePageState extends State<DictHomePage> {
  String dropdownFrom = "Portuguese";
  String dropdownTo = "Waiwai";
  String userinput = "";
  String result = "";

  List <String> availableLang =  <String>['Portuguese', 'Waiwai', 'TEST1', 'TEST2'];
  List <String> languageCode =  <String>['pt', 'wai', 't1', 't2'];
//Translate

  resultTranslate()async{
    // final translator = GoogleTranslator();
    // translator.translate(userinput, from: languageCode[availableLang.indexOf(dropdownFrom)], to: languageCode[availableLang.indexOf(dropdownTo)]).then(print);
    // var translation = await translator.translate(userinput, to: languageCode[availableLang.indexOf(dropdownTo)]);
    setState(() {
      //result = translation.text;
      result = "tracução";
    });
  }
  callTranslatorPage(){
    try{
      Navigator.of(context).push(
      CupertinoPageRoute(builder: (ctx) =>  const TransHomePage()));
    }catch(e){}
  }

  callDictionaryPage(){
    try{
    }catch(e){}
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dictionary"),
        elevation: 0.0,
      ),
      //menu appbar
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            const DrawerHeader(child: Icon(Icons.home_filled)),
            ListTile(
              leading: const Icon(Icons.translate),
              title: const  Text("T R A N S L A T O R", ),
              onTap: callTranslatorPage,// ENVIA PARA A PAGINA DE TRADUÇÃO
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text("D I C T I O N A R Y"),
              onTap:callDictionaryPage,// enviar para 
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("L O G O U T"),
              onTap: (){
                Navigator.of(context).push(CupertinoPageRoute(builder: (ctx) =>  const LoginPage()));//logout
              }
            ),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(40),
        child: ListView(
          children: [
            Row(
              children: [
               Expanded(flex: 1, child:Text('From:  ',style: GoogleFonts.roboto(color: Colors.lightBlue,fontWeight: FontWeight.bold,fontSize: 15)),),
                Expanded(
                  flex: 5,
                  child: DropdownButton<String>(
                    value: dropdownFrom,
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownFrom = newValue!;
                      });
                    },
                    items: availableLang
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),


            Row(
              children: [
                Expanded(flex: 1, child: Text('To:  ',          
                  style: GoogleFonts.roboto(color: Colors.lightBlue,fontWeight: FontWeight.bold,fontSize: 15)
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: DropdownButton<String>(
                    value: dropdownTo,
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownTo = newValue!;
                      });
                    },
                    items: availableLang
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),

            TextField(
              maxLines: 5,
              onChanged: (val) {
                setState(() {
                  userinput = val;
                });
              },
              decoration: const InputDecoration(
                  hintText: "Digite algo",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(15)))),
            ),

            const SizedBox(height: 10,),

            MaterialButton(
                height: 50,
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(color: Colors.blue,)
                ),
                child:  Text('Translate',
                  style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
),
                onPressed: (){
                  resultTranslate();
                }
              ),

              // Result
              const SizedBox(height: 10,),
              Center(child: Text('Resultado: $result', style: const TextStyle(color: Colors.black, fontSize: 20 ))),
         
              const SizedBox(height: 100,),
        


          ]
        ),
      ),
    );
  }
}