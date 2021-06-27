import 'dart:collection';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:re7al/Widgets/Constants.dart';

class Map extends StatefulWidget {
  const Map({Key key}) : super(key: key);

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(25),
          child: Container(
            foregroundDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: bk_color, width: 10),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: bk_color, width: 10),
            ),
            child: Image.asset(
              'images/blurryMap.jpeg',
            ),
          ),
        ),
        Center(
          child: Container(
            width: 220,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 20.0,
                ),
              ],
              border: Border.all(color: bk_color, width: 3),
              borderRadius: BorderRadius.circular(12),
              color: bk_color,
            ),
            child: FlatButton(
              child: Text(
                'Enter to FullScreen',
                style: TextStyle(color: user_auth, fontSize: 21),
                //style: kBodyText.copyWith(fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                setState(() {
                  Navigator.pushNamed(context, 'FullScreenMap');
                });
              },
            ),
          ),
        )
      ],
    );
  }
}
