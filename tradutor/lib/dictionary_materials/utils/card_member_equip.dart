import 'package:flutter/material.dart';

CardMember(String imagem, String nome, String description, double escala) {
  return Card(
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imagem,
              scale: escala,
            ),
            const SizedBox(width: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  Text(
                    nome,
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 15),
                  )
                ],
              ),
            )
          ],
        )
      ],
    ),
  );
}
