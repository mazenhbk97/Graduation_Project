import 'package:flutter/cupertino.dart';

class PlaceModel {
  String id;
  String name;
  String address;
  String image;
  String description;
  bool isFav;
  num rating;
  num reviews;
  int cityId;
  int serviceId;
  List<String> media;
  List<double> coordinates;

  PlaceModel(
      {@required this.id,
      @required this.name,
      @required this.image,
      @required this.reviews,
      @required this.address,
      @required this.media,
      this.isFav = false,
      this.description,
      @required this.rating});

  PlaceModel.fromJson(Map<String, dynamic> placeMap) {
    this.id = placeMap['id'];
    this.address = placeMap['address'];
    this.image = placeMap['image'];
    this.name = placeMap['name'];
    this.rating = placeMap['rating'];
    this.reviews = placeMap['reviews'];
    this.media =
        (placeMap['media'] as List<dynamic>).map((e) => e.toString()).toList();
    this.coordinates = (placeMap['location']['coordinates'] as List<dynamic>)
        .map((e) => double.parse(e.toString()))
        .toList();
    this.isFav = false;
    this.description = placeMap["description"];
  }
}
