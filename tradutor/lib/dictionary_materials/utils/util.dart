import 'package:shared_preferences/shared_preferences.dart';

Future<bool> verificarUser() async{
  SharedPreferences _sharedPreference = await SharedPreferences.getInstance();
  String? token = _sharedPreference.getString('token');

  if(token == null){
    return false;

  }else{
    return true;
  }
}