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
    print("selectedCity :${_selectedCity.toString()}");
    notifyListeners();
  }

  Future<void> fetchCities() async {
    try {
      final url = Uri.parse("${Public.baseUrl}/cities");
      final response = await http.get(url);
      print(" response type ${response.body.runtimeType}");
      final responseData = jsonDecode(response.body) as List<dynamic>;
      print("${responseData}");
      _cities = responseData
          .map((e) => City.fromMap(e as Map<String, dynamic>))
          .toList();
      print('name :${_cities[0].name}');
      notifyListeners();
    } catch (e) {
      print("error $e");
    }
  }
}
