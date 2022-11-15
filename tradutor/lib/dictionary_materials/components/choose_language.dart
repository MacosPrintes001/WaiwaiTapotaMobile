import 'package:flutter/material.dart';
import '../models/language .dart';
import '../pages/language_page.dart';

class ChooseLanguage extends StatefulWidget {
  const ChooseLanguage({super.key});

  @override
  State<ChooseLanguage> createState() => _ChooseLanguageState();
}

class _ChooseLanguageState extends State<ChooseLanguage> {
  Language _firstLanguage = Language('en', 'English', true, true, true);
  Language _secondLanguage = Language('fr', 'French', true, true, true);
  void _switchLanguage() {
    Language _tmpLanguage = _firstLanguage;

    setState(() {
      _firstLanguage = _secondLanguage;
      _secondLanguage = _tmpLanguage;
    });

    widget._onLanguageChanged(_firstLanguage, _secondLanguage);
  }
  void _chooseFirstLanguage(String title, bool isAutomaticEnabled) async {
    final language = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LanguagePage(
              title: title,
              isAutomaticEnabled: isAutomaticEnabled,
            ),
      ),
    );

    if (language != null) {
      setState(() {
        _firstLanguage = language;
      });

      widget.onLanguageChanged(_firstLanguage, _secondLanguage);
    }
  }

  // Choose a new second language
  void _chooseSecondLanguage(String title, bool isAutomaticEnabled) async {
    final language = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LanguagePage(
              title: title,
              isAutomaticEnabled: isAutomaticEnabled,
            ),
      ),
    );

    if (language != null) {
      setState(() {
        _secondLanguage = language;
      });

      widget.onLanguageChanged(_firstLanguage, _secondLanguage);
    }
  }
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
                onTap: () {
                  _chooseFirstLanguage("Translate from", true);
                },
                child: Center(
                  child: Text(
                    _firstLanguage.name,
                    style: TextStyle(
                      color: Colors.blue[600],
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Material(
            color: Colors.white,
            child: IconButton(
              icon: Icon(
                Icons.compare_arrows,
                color: Colors.grey[700],
              ),
              onPressed: _switchLanguage,
            ),
          ),
          Expanded(
            child: Material(
              color: Colors.white,
              child: InkWell(
                onTap: () {
                  _chooseSecondLanguage("Translate to", false);
                },
                child: Center(
                  child: Text(
                    _secondLanguage.name,
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