// ignore_for_file: implementation_imports, depend_on_referenced_packages
import 'package:flutter/material.dart';

import 'action_button.dart';

class TranslateText extends StatefulWidget {
  const TranslateText({super.key, required this.onTextTouched});

  final Function(bool) onTextTouched;

  @override
  State<TranslateText> createState() => _TranslateTextState();
}

class _TranslateTextState extends State<TranslateText> {

  @override
  Widget build(BuildContext context) {

    return Card(
      color: Colors.white,
      margin: const EdgeInsets.all(0.0),
      elevation: 2.0,
      child: SizedBox(
        height: 150.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: InkWell(
                onTap: () {
                  widget.onTextTouched(true);
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                  child: Text(
                    "Enter text",
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ActionButton(
                  icon: Icons.voice_chat_outlined,
                  text: "text",
                  onClick: () {},
                  imageIcon: const AssetImage(''),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
