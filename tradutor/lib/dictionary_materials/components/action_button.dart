// ignore_for_file: unnecessary_this, unnecessary_null_comparison

import 'package:flutter/material.dart';

class ActionButton extends StatefulWidget {
  const ActionButton(
      {super.key,
      required this.icon,
      required this.text, required this.onClick});

  final IconData icon;
  final String text;
  final Function onClick;
  
  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {

  Widget _displayIcon() {
    if (this.widget.icon != null) {
      return Icon(
        this.widget.icon,
        size: 23.0,
        color: Colors.blue[800],
      );
    } else {
      return Container();
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: TextButton(
        // padding: EdgeInsets.only(
        //   left: 8.0,
        //   right: 8.0,
        //   top: 2.0,
        //   bottom: 2.0,
        // ),
        onPressed: () {
          widget.onClick();
        },
        child: Column(
          children: <Widget>[
            _displayIcon(),
            Text(
              this.widget.text,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
