import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'dart:math';
import 'package:re7al/data_models/place.dart';
import 'package:re7al/providers/places_provider.dart';
import 'package:re7al/screens/Place.dart';

class Place_Card extends StatefulWidget {
  List<PlaceModel> places;
  Place_Card(this.places);
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

  Widget _Card1(String img, String name, num rate, String id) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      elevation: 2,
      margin: EdgeInsets.all(10),
      child: Wrap(
        children: [
          Stack(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: img == null || img.endsWith("gif")
                      ? image1
                      : Image.network(img)),
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
                    name,
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
                      right: 10,
                      child: Text(
                        rate == null ? "N/F" : '$rate',
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
              Positioned(
                top: 0,
                left: 10,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    color: Colors.red.withOpacity(0.8),
                  ),
                  width: 40,
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Icon(
                    Icons.home_outlined,
                    color: Colors.white,
                  ),
                  // child: Text(
                  //   card1_name,
                  //   style: TextStyle(
                  //     fontSize: 20,
                  //     color: Colors.white,
                  //   ),
                  //   softWrap: true,
                  //   overflow: TextOverflow.fade,
                  // ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _Card2(Image card2_img, String card2_name) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'Place');
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        elevation: 2,
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
                Positioned(
                  top: 0,
                  left: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      color: Colors.red.withOpacity(0.8),
                    ),
                    width: 40,
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Icon(
                      Icons.grass_outlined,
                      color: Colors.white,
                    ),
                    // child: Text(
                    //   card1_name,
                    //   style: TextStyle(
                    //     fontSize: 20,
                    //     color: Colors.white,
                    //   ),
                    //   softWrap: true,
                    //   overflow: TextOverflow.fade,
                    // ),
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
        child: StaggeredGridView.countBuilder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 4,
      itemCount: widget.places.length,
      itemBuilder: (BuildContext context, int i) => GestureDetector(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx) => Place(widget.places[i])));
        },
        child: _Card1(widget.places[i].image, widget.places[i].name,
            widget.places[i].rating, widget.places[i].id),
      ),
      staggeredTileBuilder: (int index) => StaggeredTile.count(2, 2),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    ));
  }
}
