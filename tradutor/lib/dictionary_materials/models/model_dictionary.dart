//Modelo simplificado de dicionario
// ignore_for_file: camel_case_types

class wordModel {
  String? wordPort;
  String? translationWaiwai;
  String? category;
  String? meaningPort;
  String? meaningWaiwai;
  String? synonymPort;
  String? synonymWaiwai;

  wordModel(
      {this.wordPort,
      this.translationWaiwai,
      this.category,
      this.meaningPort,
      this.meaningWaiwai,
      this.synonymPort,
      this.synonymWaiwai});

  wordModel.fromJson(Map<String, dynamic> json) {
    wordPort = json['wordPort'];
    translationWaiwai = json['translationWaiwai'];
    category = json['category'];
    meaningPort = json['meaningPort'];
    meaningWaiwai = json['meaningWaiwai'];
    synonymPort = json['synonymPort'];
    synonymWaiwai = json['synonymWaiwai'];
  }

  get brWord => null;

  get waiWord => null;

  get brDescription => null;

  get WaiDescription => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['wordPort'] = this.wordPort;
    data['translationWaiwai'] = this.translationWaiwai;
    data['category'] = this.category;
    data['meaningPort'] = this.meaningPort;
    data['meaningWaiwai'] = this.meaningWaiwai;
    data['synonymPort'] = this.synonymPort;
    data['synonymWaiwai'] = this.synonymWaiwai;
    return data;
  }
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

class cadastroUserModel {
  String? username;
  String? email;
  String? password;

  cadastroUserModel({this.username, this.email, this.password});

  cadastroUserModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
