import 'package:flutter/material.dart';
import 'package:re7al/Models/MyNavigationBar.dart';
import 'package:re7al/Models/Places.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
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
      body: Column(),
      //BottomNavigationBar(),
    );
  }
}
