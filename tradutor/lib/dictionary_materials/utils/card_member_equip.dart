import 'package:flutter/material.dart';

CardMember(String imagem, nome, description) {
  return Card(
    child: Column(
      children: [
        Image.asset(
          imagem,
          scale: 1.5,
        ),
        const SizedBox(width: 10),
        Column(
          children: [
            Text(
              "$nome",
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              "$description",
              style: const TextStyle(fontSize: 15),
            )
          ],
        )
      ],
    ),
  );
}
