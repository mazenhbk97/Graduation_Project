import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:re7al/data_models/place.dart';
import 'package:re7al/helpers/public.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlacesProvider with ChangeNotifier {
  List<PlaceModel> _savedPlaces = [];
  List<PlaceModel> _cityPlaces = [];
  PlaceModel _selectedPlace;

  void selectPlace(String id) {
    _selectedPlace = _savedPlaces.firstWhere((element) => element.id == id);
    if (_selectedPlace != null) {
      _selectedPlace.isFav = true;
    }
    _selectedPlace = _cityPlaces.firstWhere((element) => element.id == id);
    notifyListeners();
  }

  List<PlaceModel> get savedPlaces {
    print(" helloo ${_savedPlaces.toString()}");
    return _savedPlaces;
  }

  PlaceModel get selectedPlace {
    return _selectedPlace;
  }

  Future<List<PlaceModel>> getSavedPlaces(String urlSeg) async {
    Uri uri = Uri.parse('${Public.baseUrl}/users/saved/$urlSeg');

    String token = await _getToken();

    try {
      final response = await http.get(uri, headers: {'auth-token': token});

      final responseData = jsonDecode(response.body) as List<dynamic>;

      _savedPlaces = responseData.map((e) => PlaceModel.fromJson(e)).toList();
      notifyListeners();
    } catch (e) {
      print("error: $e");
    }
    return [..._savedPlaces];
  }

  Future<String> _getToken() async {
    final prefs = await SharedPreferences.getInstance();

    String token = prefs.getString('token');
    return token;
  }

  Future<List<PlaceModel>> getCityPlaces(String cityId) async {
    Uri uri = Uri.parse('${Public.baseUrl}/places/cities/$cityId');

    try {
      final response = await http.get(uri);
      final responseData = jsonDecode(response.body) as List<dynamic>;

      _cityPlaces = responseData.map((e) => PlaceModel.fromJson(e)).toList();
      notifyListeners();
    } catch (e) {
      print("error: $e");
    }
    return [..._cityPlaces];
  }

  Future<void> favourite(PlaceModel place) async {
    try {
      final url = Uri.parse("${Public.baseUrl}/users/savePlaces/${place.id}");
      String token = await _getToken();

      if (_savedPlaces.contains(place)) {
        _savedPlaces.remove(place);
      } else {
        _savedPlaces.add(place);
      }
      final response = await http.post(url, headers: {"auth-token": token});
      notifyListeners();
    } catch (e) {
      print("error: $e");
    }
  }
}
