import 'package:flutter/material.dart';

class User {
  String id, name, email, imgUrl;
  User({@required this.id, this.name, this.email, this.imgUrl});

  User.fromMap(Map<String, dynamic> userMap) {
    this.id = userMap['id'];
    this.name = userMap['name'];
    this.email = userMap['email'];
    this.imgUrl = userMap['image'];
  }
}
