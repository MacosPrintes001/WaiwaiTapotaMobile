// ignore_for_file: unnecessary_this, unnecessary_null_comparison

import 'package:flutter/material.dart';

class ActionButton extends StatefulWidget {
  const ActionButton(
      {super.key,
      required this.icon,
      required this.text});

  final IconData icon;
  final String text;

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: TextButton(
        onPressed: () {},
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

  Widget _displayIcon() {
    if (this.widget.icon != null) {
      return Icon(
        this.widget.icon,
        size: 23.0,
      );
    } else {
      return Container();
    }
  }
}
