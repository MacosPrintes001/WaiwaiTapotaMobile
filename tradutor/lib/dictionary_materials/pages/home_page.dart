import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';


import '../components/choose_language.dart';
import '../components/translate_input.dart';
import '../components/translate_text.dart';
import '../components/list_translate.dart';
import '../models/language .dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

    
  _onTextTouched(bool isTouched) {
    Tween _tween = SizeTween(
      begin: Size(0.0, kToolbarHeight),
      end: Size(0.0, 0.0),
    );

    //_animation = _tween.animate(_controller);

    if (isTouched) {
      // FocusScope.of(context).requestFocus(_textFocusNode);
      // _controller.forward();
    } else {
      FocusScope.of(context).requestFocus(FocusNode());
      //_controller.reverse();
    }

    //_translateProvider.setIsTranslating(isTouched);
  }

  @override
  Widget build(BuildContext context) {

    var _textFocusNode;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBar(
          title: Text(widget.title),
          elevation: 0.0,
          centerTitle: true,
        ),
      ),
      body: Column(
        children: <Widget>[
          const ChooseLanguage(),
          Stack(
            children: <Widget>[
              Offstage(
                //offstage: _translateProvider.isTranslating,
                child: TranslateText(
                  onTextTouched: _onTextTouched,
                ),
              ),
              Offstage(
                //offstage: !_translateProvider.isTranslating,
                child: TranslateInput(
                  onCloseClicked: _onTextTouched,
                  focusNode: _textFocusNode,
                ),
              ),
            ],
          ),
          Expanded(
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 8.0),
                  child: ListTranslate(),
                ),
               
              ],
            ),
          ),
        ],
      ),
    );
  }
}

