import 'package:flutter/material.dart';

CardMember(String imagem, String nome, String description, double escala) {
  return Card(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imagem,
          scale: escala,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 2,
            ),
            Text(
              nome,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              description,
              style: const TextStyle(fontSize: 15),
            ),
          ],
        )
      ],
    ),
  );
}
