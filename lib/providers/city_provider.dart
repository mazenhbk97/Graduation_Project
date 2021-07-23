import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:re7al/Models/city.dart';
import 'package:re7al/helpers/public.dart';
import 'package:http/http.dart' as http;

class CityProvider with ChangeNotifier {
  List<City> _cities = [];

  City _selectedCity;

  List<City> get cities {
    return [..._cities];
  }

  City get selectedCity {
    return _selectedCity;
  }

  void selectCity(String name) {
    _selectedCity = _cities.firstWhere((element) => element.name == name);
    notifyListeners();
  }

  Future<List<City>> fetchCities() async {
    try {
      final url = Uri.parse("${Public.baseUrl}/cities");
      final response = await http.get(url);
      final responseData = jsonDecode(response.body) as List<dynamic>;
      _cities = responseData
          .map((e) => City.fromMap(e as Map<String, dynamic>))
          .toList();
      print(_cities.toString());
      return [..._cities];
    } catch (e) {
      throw e;
    }
  }
}
