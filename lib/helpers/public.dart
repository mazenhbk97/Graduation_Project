import 'package:shared_preferences/shared_preferences.dart';

class Public {
  static const baseUrl = 'https://rehalapp2021.herokuapp.com';
  static Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();

    String token = prefs.getString('token');
    return token;
  }
}
