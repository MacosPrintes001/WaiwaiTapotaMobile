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
  String? email;
  String? password;

  loginModel({this.email, this.password});

  loginModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}

class CadastroModel {
  String? username;
  String? email;
  String? password;

  CadastroModel(this.username, this.email, this.password);
}
