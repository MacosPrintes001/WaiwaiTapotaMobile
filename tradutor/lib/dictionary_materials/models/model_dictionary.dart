//Modelo simplificado de dicionario
// ignore_for_file: camel_case_types


class wordModel {
  String exampleSentence = "";
  String wodrId = "";
  String category = "";
  String meaningPort = "";
  String meaningWaiwai = "";
  String synonymPort = "";
  String synonymWaiwai = "";
  String fonema = "";

  wordModel({
    required this.category,
    required this.meaningPort,
    required this.meaningWaiwai,
    required this.synonymPort,
    required this.synonymWaiwai,
    required this.wodrId,
    required this.exampleSentence,
    required this.fonema
  });

  wordModel.fromJson(Map<String, dynamic> json) {
    exampleSentence = json['exampleSentence'];
    category = json['category'];
    meaningPort = json['meaningPort'];
    meaningWaiwai = json['meaningWaiwai'];
    synonymPort = json['synonymPort'];
    synonymWaiwai = json['synonymWaiwai'];
    wodrId = json['_id'];
    fonema = json['phonemicWaiwai'];
    //image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category'] = category;
    data['meaningPort'] = meaningPort;
    data['meaningWaiwai'] = meaningWaiwai;
    data['synonymPort'] = synonymPort;
    data['synonymWaiwai'] = synonymWaiwai;
    data['exampleSentence'] = exampleSentence;
    data['_id'] = wodrId;
    data['phonemicWaiwai'] = fonema;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
