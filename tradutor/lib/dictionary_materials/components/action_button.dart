// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';

class ActionButton extends StatefulWidget {
  const ActionButton(
      {super.key,
      required this.icon,
      required this.imageIcon,
      required this.text,
      required this.onClick});

  final IconData icon;
  final AssetImage imageIcon;
  final String text;
  final Function onClick;

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  Widget _displayIcon() {
    if (widget.icon != null) {
      return Icon(
        widget.icon,
        size: 23.0,
        color: Colors.blue[800],
      );
    } else if (widget.imageIcon != null) {
      return ImageIcon(
        widget.imageIcon,
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
        onPressed: () {
          widget.onClick();
        },
        style: TextButton.styleFrom(
          padding: const EdgeInsets.only(
            left: 8.0,
            right: 8.0,
            top: 2.0,
            bottom: 2.0,
          ),
        ),
        child: Column(
          children: <Widget>[
            _displayIcon(),
            Text(
              widget.text,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
