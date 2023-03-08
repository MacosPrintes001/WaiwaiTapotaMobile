import 'package:flutter/material.dart';

import '../dictionary_materials/utils/card_member_equip.dart';

class AboutEquipePage extends StatefulWidget {
  const AboutEquipePage({super.key});

  @override
  State<AboutEquipePage> createState() => _AboutEquipePageState();
}

class _AboutEquipePageState extends State<AboutEquipePage> {
  String camila = "assets/equipImages/camila.png";
  String crystian = "assets/equipImages/crys.png";
  String davia = "assets/equipImages/davia.jpg";
  String debs = "assets/equipImages/debs.jpeg";
  String flavia = "assets/equipImages/flavia.jpg";
  String marcos = "assets/equipImages/marcos.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Sobre Nossa Equipe"),
        backgroundColor: const Color.fromRGBO(166, 51, 41, 1),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            CardMember(camila, "Camila Jacome", "Pesquisadora", 3),
            CardMember(crystian, "Crystian Printes",
                "Desenvolvedor Frontend React", 11),
            CardMember(davia, "Dávia Marciana Talgatti", "Pesquisadora", 10),
            CardMember(
                debs, "Debora marciao dos santos", "Designer Gráfico", 15),
            CardMember(flavia, "Flávia Pessoa Monteiro",
                "Gerente e Projetista de Software", 10),
            CardMember(
                marcos, "Marcos V. C. Printes", "Desenvolvedor Mobile", 7),
          ],
        ),
      ),
    );
  }
}
