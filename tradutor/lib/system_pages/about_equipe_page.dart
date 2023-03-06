import 'package:flutter/material.dart';

import '../dictionary_materials/utils/card_member_equip.dart';

class AboutEquipePage extends StatefulWidget {
  const AboutEquipePage({super.key});

  @override
  State<AboutEquipePage> createState() => _AboutEquipePageState();
}

class _AboutEquipePageState extends State<AboutEquipePage> {
  String camila = "assets/equipImages/camila.jpeg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Sobre Nossa Equipe"),
        backgroundColor: const Color.fromRGBO(166, 51, 41, 1),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                CardMember(camila, "Camila Jacome", "Lorem ipsum")
               ],
            )
          ],
        ),
      ),
    );
  }
}
