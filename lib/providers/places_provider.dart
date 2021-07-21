import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:re7al/data_models/place.dart';
import 'package:re7al/helpers/public.dart';

class PlacesProvider with ChangeNotifier {
  List<PlaceModel> _savedPlaces = [];
  List<PlaceModel> _cityPlaces = [];
  List<PlaceModel> _filteredPlaces = [];
  PlaceModel _selectedPlace;

  void selectPlace(String id) {
    _selectedPlace = _savedPlaces.firstWhere((element) => element.id == id);
    if (_selectedPlace != null) {
      _selectedPlace.isFav = true;
    }
    _selectedPlace = _cityPlaces.firstWhere((element) => element.id == id);
    notifyListeners();
  }

  List<PlaceModel> get filteredPlaces {
    if (_filteredPlaces.isEmpty) {
      return [..._cityPlaces];
    } else {
      return [..._filteredPlaces];
    }
  }

  List<PlaceModel> get savedPlaces {
    return [..._savedPlaces];
  }

  PlaceModel get selectedPlace {
    return _selectedPlace;
  }

  bool isFav(String placeId) {
    if (_savedPlaces.isEmpty) {
      return false;
    }
    PlaceModel place =
        _savedPlaces.firstWhere((element) => element.id == placeId);
    return place == null ? false : true;
  }

  void filterPlaces(int serviceId) {
    _filteredPlaces =
        _cityPlaces.where((element) => element.serviceId == serviceId).toList();
    notifyListeners();
  }

  Future<List<PlaceModel>> getSavedPlaces(String urlSeg) async {
    Uri uri = Uri.parse('${Public.baseUrl}/users/saved/$urlSeg');

    String token = await Public.getToken();

    try {
      final response = await http.get(uri, headers: {'auth-token': token});

      final responseData = jsonDecode(response.body) as List<dynamic>;

      _savedPlaces = responseData.map((e) => PlaceModel.fromJson(e)).toList();
    } catch (e) {
      throw e;
    }
    return [..._savedPlaces];
  }

  Future<List<PlaceModel>> getCityPlaces(String cityId) async {
    Uri uri = Uri.parse('${Public.baseUrl}/places/cities/$cityId');

    try {
      final response = await http.get(uri);
      final responseData = jsonDecode(response.body) as List<dynamic>;

      _cityPlaces = responseData.map((e) => PlaceModel.fromJson(e)).toList();
      notifyListeners();
    } catch (e) {
      throw e;
    }
    return [..._cityPlaces];
  }

  Future<void> favourite(PlaceModel place) async {
    try {
      final url = Uri.parse("${Public.baseUrl}/users/savePlaces/${place.id}");
      String token = await Public.getToken();
      print(token);

      if (_savedPlaces.contains(place)) {
        _savedPlaces.remove(place);
      } else {
        _savedPlaces.add(place);
      }
      notifyListeners();

      await http.post(url, headers: {"auth-token": token});
    } catch (e) {
      throw e;
    }
  }

  Future<List<PlaceModel>> fetchNearest(String cityId, String serviceId) async {
    Uri uri = Uri.parse(
        "${Public.baseUrl}/places/cities/$cityId/services/$serviceId");

    String token = await Public.getToken();
    print(
      "cityId :$cityId    serviceId: $serviceId",
    );
    List<PlaceModel> nearest = [];
    try {
      final response = await http.get(uri, headers: {'auth-token': token});
      print("response :${response.body}");
      final responseData = jsonDecode(response.body) as List<dynamic>;
      nearest = responseData.map((e) => PlaceModel.fromJson(e)).toList();
    } catch (e) {
      throw e;
    }
    return nearest;
  }
}
