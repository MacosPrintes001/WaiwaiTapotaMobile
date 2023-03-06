import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutProjectPage extends StatefulWidget {
  const AboutProjectPage({super.key});

  @override
  State<AboutProjectPage> createState() => _AboutProjectPageState();
}

class _AboutProjectPageState extends State<AboutProjectPage> {
  String texto1 = "Traduza e se comunique com praticidade";
  String texto2 =
      "Economize tempo com as suas traduções e concentre-se nas tarefas que realmente importam. Com o WaiwaiTapota, você tem traduções da lingua indigena Waiwai para o portugues.";

  Future<void> _launchURL(String url) async{
    final Uri uri = Uri(scheme: "https", host: url);
    if(!await launchUrl(uri, mode: LaunchMode.externalApplication)){
      throw "Não foi possivel carregar o link";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Sobre o Projeto"),
        backgroundColor: const Color.fromRGBO(166, 51, 41, 1),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Image(
                image: AssetImage('assets/tapotaLogo.png'),
                height: 180,
              ),
              const SizedBox(height: 20),
              Text(
                texto1,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Text(
                texto2,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: (){
                  _launchURL("home.waiwaitapota.homes");
                },
                child: const Text("Saiba Mais", style: TextStyle(color: Colors.blueAccent, fontSize:  20),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
