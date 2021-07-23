import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:re7al/data_models/user.dart';
import 'package:re7al/helpers/http_exception.dart';
import 'package:re7al/helpers/public.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  // ignore: unused_field
  String _token;
  // ignore: unused_field
  // ignore: unused_field
  String _userId;

  Position position;

  User _user;

  User get user {
    return _user;
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
              ? jsonEncode({
                  'email': email,
                  'password': password,
                })
              : jsonEncode(register));
      final responseData = jsonDecode(response.body) as Map<String, dynamic>;
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      _token = responseData['token'];
      _user = User.fromMap(responseData.containsKey("user")
          ? responseData["user"]
          : responseData);

      final prefs = await SharedPreferences.getInstance();
      prefs.setString('token', _token);
      notifyListeners();
    } catch (e) {
      // print("##### ${e.toString()}");
      throw e;
    }
  }

  void logout() async {
    _token = null;
    _user = null;

    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    notifyListeners();
  }

  Future<void> getLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
  }

  Future<bool> tryAutoLogIn() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('token')) {
      return false;
    }
    _token = prefs.getString('token');

    return true;
  }

  Future<void> editProfile(
      {String name,
      File img,
      @required String token,
      @required String type}) async {
    try {
      final url = 'https://rehalapp2021.herokuapp.com/users/edit';
      final file =
          MultipartFile(img.openRead(), await img.length(), filename: img.path);
      FormData formData = FormData.fromMap({'image': file});
      Dio dio = Dio();
      dio.options.headers['auth-token'] = token;
      final response = await dio.put(
        url,
        data: formData,
      );
      final responseData = response.data as Map<String, dynamic>;
      _user = User.fromMap(responseData);
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  Future<User> getProfile() async {
    final url = Uri.parse('https://rehalapp2021.herokuapp.com/users/profile');
    final pref = await SharedPreferences.getInstance();
    if (pref.containsKey("token") || _token != null) {
      String token = pref.getString('token');
      _token = _token ?? token;
      try {
        final response = await http.get(url, headers: {'auth-token': token});
        final responseData = jsonDecode(response.body) as Map<String, dynamic>;

        _user = User.fromMap(responseData);
        notifyListeners();
      } catch (e) {
        throw e;
      }
    }
    return _user;
  }

  Future<void> googleSign() async {
    try {
      final googleSign = GoogleSignIn();
      final googleAccount = await googleSign.signIn();
      if (googleAccount == null) {
        throw HttpException("Cancelled by user");
      }
      final googleSignIn = await googleAccount.authentication;
      final uri = Uri.parse("${Public.baseUrl}/users/Oauth/google");
      final response = await http
          .post(uri, body: {"access_token": googleSignIn.accessToken});
      final responseData = jsonDecode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      _token = responseData['token'];

      final prefs = await SharedPreferences.getInstance();
      prefs.setString('token', _token);
      _token = prefs.getString('token');
      notifyListeners();
    } catch (e) {
      throw HttpException("Error While Loggin in");
    }
  }
}
