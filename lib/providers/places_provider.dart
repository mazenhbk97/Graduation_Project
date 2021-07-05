import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:re7al/data_models/place.dart';
import 'package:re7al/helpers/public.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlacesProvider with ChangeNotifier {
  List<PlaceModel> _savedPlaces = [];
  PlaceModel _selectedPlace;

  void selectPlace(String id) {
    _selectedPlace = _savedPlaces.firstWhere((element) => element.id == id);
    _selectedPlace.isFav = true;
  }

  PlaceModel get selectedPlace {
    return _selectedPlace;
  }

  Future<List<PlaceModel>> getSavedPlaces(String urlSeg) async {
    Uri uri = Uri.parse('${Public.baseUrl}/users/saved/$urlSeg');
    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOjI0LCJlbWFpbCI6Im90aG1hbmF0ZWY4OUBnbWFpbC5jb20iLCJpc0FkbWluIjpmYWxzZSwiaWF0IjoxNjI0NDY2MjA3fQ.SXJ9GTde9p7JuSiaJm5o38ho8-eBk7KUpC_8OwLt-Q4";

    try {
      final response = await http.get(uri, headers: {'auth-token': token});

      final responseData = jsonDecode(response.body) as List<dynamic>;
      print("data: ${responseData.runtimeType}");

      _savedPlaces = responseData.map((e) => PlaceModel.fromJson(e)).toList();
      notifyListeners();
    } catch (e) {
      print("error: $e");
    }
    return _savedPlaces;
  }

  Future<String> _getToken() async {
    final prefs = await SharedPreferences.getInstance();

    String token = prefs.getString('token');
    return token;
  }
}
