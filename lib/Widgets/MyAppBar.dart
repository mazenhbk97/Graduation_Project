import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Constants.dart';

class MyAppBar extends StatefulWidget {
  MyAppBar({this.MyABicon});

  Icon MyABicon;

  @override
  _MyAppBarState createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  void iconTap() {
    Navigator.pushNamed(context, 'UserProfile');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: widget.MyABicon,
          color: font_color,
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
        title: Material(
          borderRadius: BorderRadius.circular(25),
          elevation: 5,
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                size: 35,
              ),
              hintText: "Search",
              border: InputBorder.none,
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () => iconTap(),
            child: CircleAvatar(
              foregroundImage: AssetImage(
                'images/bestPlaces.png',
              ),
              maxRadius: 35,
            ),
          )
        ],
      ),
    );
  }
}
