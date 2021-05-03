import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:re7al/Models/Places.dart';
import 'dart:math';

class Place_Card extends StatefulWidget {
  @override
  _Place_CardState createState() => _Place_CardState();
}

class _Place_CardState extends State<Place_Card> {
  void select_card() {}

  Image image1 = Image.asset('images/bestPlaces.png');
  Image image2 = Image.asset('images/bestPlaces2.png');
  Image image3 = Image.asset('images/bestPlaces3.png');
  Image image4 = Image.asset('images/bestPlaces4.png');

  //String Place_name;

  Widget _Card1(Image card1_img, String card1_name) {
    return GestureDetector(
      onTap: select_card,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        elevation: 3,
        margin: EdgeInsets.all(10),
        child: Wrap(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: card1_img,
                ),
                Positioned(
                  bottom: 20,
                  right: 30,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      color: Colors.black54,
                    ),
                    width: 140,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    child: Text(
                      card1_name,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 20,
                  child: Stack(
                    children: [
                      IconButton(
                        onPressed: () {
                          debugPrint("Starred Me!");
                        },
                        color: Colors.yellow,
                        icon: Icon(
                          Icons.star,
                          size: 50,
                        ),
                        disabledColor: Colors.grey,
                        highlightColor: Colors.black38,
                      ),
                      Positioned(
                        top: 25,
                        right: 4,
                        child: Text(
                          '3.5',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _Card2(Image card2_img, String card2_name) {
    return GestureDetector(
      onTap: select_card,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Wrap(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: card2_img,
                ),
                Positioned(
                  bottom: 20,
                  right: 30,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      color: Colors.black54,
                    ),
                    width: 140,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Text(
                      card2_name,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 20,
                  child: Stack(
                    children: [
                      IconButton(
                        onPressed: () {
                          debugPrint("Starred Me!");
                        },
                        color: Colors.yellow,
                        icon: Icon(
                          Icons.star,
                          size: 50,
                        ),
                        disabledColor: Colors.grey,
                        highlightColor: Colors.black38,
                      ),
                      Positioned(
                        top: 25,
                        right: 4,
                        child: Text(
                          '3.5',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        _Card1(image1, 'Toursim'),
                        _Card2(image3, 'Restaurant')
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        _Card2(image2, 'Restaurant'),
                        _Card1(image4, 'Hospital')
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
