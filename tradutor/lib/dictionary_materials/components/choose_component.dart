import 'package:flutter/material.dart';

class ChooseLanguage extends StatefulWidget {
  const ChooseLanguage({super.key});

  @override
  State<ChooseLanguage> createState() => _ChooseLanguageState();
}

class _ChooseLanguageState extends State<ChooseLanguage> {

  List <String> availableLang =  <String>['Portugues', 'Waiwai', 'TEST1', 'TEST2'];
  List <String> languageCode =  <String>['pt', 'wai', 't1', 't2'];
  
  String _firstLanguage = "Portugues";
  String _secondLanguage = "Waiwai";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.0,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Colors.grey,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Material(
              color: Colors.white,
              child: InkWell(
                onTap: () {},
                child: Center(
                  child: Text(
                    // ignore: unnecessary_this
                    this._firstLanguage,
                    style: TextStyle(
                      color: Colors.blue[600],
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          
          //setas mudar idioma
          // Material(
          //   color: Colors.white,
          //   child: IconButton(
          //     icon: Icon(
          //       Icons.compare_arrows,
          //       color: Colors.grey[700],
          //     ),
          //     onPressed: () {},
          //   ),
          // ),

          Expanded(
            child: Material(
              color: Colors.white,
              child: InkWell(
                onTap: () {},
                child: Center(
                  child: Text(
                    this._secondLanguage,
                    style: TextStyle(
                      color: Colors.blue[600],
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
