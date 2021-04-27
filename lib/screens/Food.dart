import 'package:flutter/material.dart';
import 'package:re7al/Models/Places.dart';

class Food extends StatefulWidget {
  @override
  _FoodState createState() => _FoodState();
}

class _FoodState extends State<Food> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: AppBar(
          flexibleSpace: SafeArea(child: SearchBar()),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
