import 'package:shared_preferences/shared_preferences.dart';

Future<bool> verificarUser() async {
  final prefs = await SharedPreferences.getInstance();
  final String? token = prefs.getString('token');

  if (token == null) {
    print("tem nada");
    return false;
  } else {
    print("Tem token");
    return true;
  }
}
