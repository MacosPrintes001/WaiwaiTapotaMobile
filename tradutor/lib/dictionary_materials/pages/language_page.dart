import 'package:flutter/material.dart';

import '../models/language .dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage(
      {super.key, required this.title, required this.isAutomaticEnabled});

  final String title;
  final bool isAutomaticEnabled;

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  final TextEditingController _searchTextController =
      TextEditingController(); // Controller instancied

  final List<Language> _languageList = [
    Language('auto', 'Automatic', false, false, false),
    Language('fr', 'French', true, true, true),
  ];

  IconButton? _displayDeleteTextIcon() {
    if (this._searchTextController.text.length > 0) {
      return IconButton(
        icon: Icon(Icons.close),
        color: Colors.grey,
        onPressed: () {
          setState(() {
            _searchTextController.text = ""; // Reset the text
          });
        },
      );
    } else {
      return null; // We don't display the icon
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.title),
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(
              top: 12.0,
              bottom: 12.0,
              left: 8.0,
              right: 8.0,
            ),
            child: TextField(
              controller: this._searchTextController,
              onChanged: (text) {
                setState(() {}); // Refresh the UI
              },
              decoration: const InputDecoration(
                hintText: "Search",
                border: InputBorder.none, // No border
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ), // We add this border when the input is focused
                prefixIcon: Icon(
                  Icons.search,
                  size: 24.0,
                  color: Colors.grey,
                ), 
                //suffixIcon: this._displayDeleteTextIcon(),
              ),
            ),
          ),
        ],
      ),
      
    );

    
  }
}


