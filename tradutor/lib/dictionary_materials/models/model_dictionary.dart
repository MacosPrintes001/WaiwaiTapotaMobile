//Modelo simplificado de dicionario
class WordModel {
  String? brWord;
  String? waiWord;
  String? brDescription;
  String? WaiDescription;
  //ImageBitmap? Image;

  WordModel(this.brWord, this.waiWord, this.brDescription,
      this.WaiDescription); //this.Image
}

class loginModel {
  String? username;
  String? email;
  String? password;

  loginModel(this.username, this.email, this.password);
}
