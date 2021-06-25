import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:re7al/helpers/http_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  // ignore: unused_field
  String _token;
  // ignore: unused_field
  // ignore: unused_field
  String _userId;

  Position position;

  bool get isAuth {
    return token != null;
  }

  String get userId {
    return _userId;
  }

  String get token {
    return _token;
  }

  Future<void> signUp(
      String email, String password, String name, String city) async {
    return _authenticate(email, password, 'register', name: name, city: city);
  }

  Future<void> signIn(String email, String password) async {
    print("mail: $email, pass: $password");
    return _authenticate(email, password, 'login');
  }

  Future<void> _authenticate(String email, String password, String urlSeg,
      {String name, String city}) async {
    await getLocation();
    Map<String, dynamic> register = {
      "name": name,
      "email": email,
      "password": password,
      "city": city,
      "location": ({
        "coordinates": [position.longitude, position.latitude]
      } as dynamic)
    };
    final url = Uri.parse('https://rehalapp2021.herokuapp.com/users/$urlSeg');
    try {
      final response = await http.post(url,
          headers: {'content-type': 'application/json'},
          body: urlSeg == 'login'
              ? {
                  'email': email,
                  'password': password,
                }
              : jsonEncode(register));
      final responseData = jsonDecode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      _token = responseData['token'];

      notifyListeners();
      final prefs = await SharedPreferences.getInstance();

      prefs.setString('token', _token);
    } catch (e) {
      // print("##### ${e.toString()}");
      throw e;
    }
  }

  void logout() async {
    _token = null;

    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    notifyListeners();
  }

  Future<void> getLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
  }

  // Future<bool> tryAutoLogIn() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   if (!prefs.containsKey('userData')) {
  //     return false;
  //   }
  //   final extractedUserData =
  //       json.decode(prefs.getString('userData')) as Map<String, Object>;
  //   final expiryDate = DateTime.parse(extractedUserData['expiryDate']);

  //   if (expiryDate.isBefore(DateTime.now())) {
  //     return false;
  //   }
  //   _token = extractedUserData['token'];
  //   _userId = extractedUserData['userId'];
  //   _expiryDate = expiryDate;
  //   notifyListeners();
  //   _autoLogout();
  //   return true;
  // }

  // void _autoLogout() {
  //   if (_authTimer != null) {
  //     _authTimer.cancel();
  //   }
  //   final timeToExpire = _expiryDate.difference(DateTime.now()).inSeconds;
  //   _authTimer = Timer(Duration(seconds: timeToExpire), logout);
  // }
}
