import 'package:flutter/material.dart';

class WordPage extends StatefulWidget {
  const WordPage({super.key});

  @override
  State<WordPage> createState() => _WordPageState();
}

class _WordPageState extends State<WordPage> {
  String textPt =
      "Lorem ipsum dolor sit amet. Rem delectus eius qui voluptas dolores et ipsum quidem sed enim optio et neque internos aut provident dolore. Sit ipsam molestias in voluptas dolores in laudantium molestiae vel odio quasi. Eum necessitatibus deleniti ut porro corrupti et eius ratione et velit harum!";
  String textWai =
      "Lorem ipsum dolor sit amet. Rem delectus eius qui voluptas dolores et ipsum quidem sed enim optio et neque internos aut provident dolore. Sit ipsam molestias in voluptas dolores in laudantium molestiae vel odio quasi. Eum necessitatibus deleniti ut porro corrupti et eius ratione et velit harum!";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(190, 0, 77, 40),
        centerTitle: true,
        title: const Text("Palavra"),
        elevation: 0.0,
        actions: [],
      ),
      body: Center(
        child: Column(
          children: [
            Column(
              children: const [
                Text(
                  "Palavra Pt-Br",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Image(
                  image: AssetImage("assets/logo.png"),
                ),
                Text(
                  "Palavra Waiwai",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Wai: $textWai"),
                const SizedBox(
                  height: 10,
                ),
                Text("Pt-Br: $textPt"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
