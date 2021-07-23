import 'package:shared_preferences/shared_preferences.dart';

class Public {
  static const baseUrl = 'https://rehalapp2021.herokuapp.com';
  static Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();

    String token = prefs.getString('token');
    return token;
  }

  static const defaultPPIC =
      "https://st4.depositphotos.com/1000507/24488/v/600/depositphotos_244889634-stock-illustration-user-profile-picture-isolate-background.jpg";
}
