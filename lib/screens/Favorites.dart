import 'package:flutter/material.dart';
import 'package:re7al/Widgets/Constants.dart';
import 'package:re7al/Widgets/MyAppBar.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: MyAppBar(
          MyABicon: Icon(
            Icons.menu_rounded,
            size: 40,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'My Saved ',
                    style: TextStyle(
                        fontSize: 30,
                        color: font_color,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.favorite_border_outlined,
                    size: 30,
                    color: font_color,
                  ),
                ],
              ),
              Row(),
            ],
          ),
        ),
      ),
    );
  }
}
