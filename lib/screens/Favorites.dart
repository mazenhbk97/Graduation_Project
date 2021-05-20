import 'package:flutter/material.dart';
import 'package:re7al/Widgets/Constants.dart';
import 'package:re7al/Widgets/Favorite_Card.dart';
import 'package:re7al/Widgets/MyAppBar.dart';
import 'package:re7al/Widgets/Place_Card.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: bk_color,
          body: Padding(
            padding: EdgeInsets.only(top: 20, right: 20, left: 20),
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
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Material(
                    borderRadius: BorderRadius.circular(50),
                    elevation: 5,
                    child: TabBar(
                      indicator: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      tabs: [
                        Tab(
                          child: Text(
                            'OverlAll',
                            style: TextStyle(color: font_color),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Highly Rated',
                            style: TextStyle(color: font_color),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'New',
                            style: TextStyle(color: font_color),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Favorite_Card(
                                CardName: 'pyramids',
                                CardDate: '22 mai 2021 ',
                                CardRating: 4.9,
                                CardReviews: 19,
                              ),
                              Favorite_Card(
                                CardName: 'pyramids',
                                CardDate: '22 mai 2021',
                                CardRating: 4.9,
                                CardReviews: 19,
                              ),
                              Favorite_Card(
                                CardName: 'pyramids',
                                CardDate: '22 mai 2021',
                                CardRating: 4.9,
                                CardReviews: 19,
                              ),
                              Favorite_Card(
                                CardName: 'pyramids',
                                CardDate: '22 mai 2021',
                                CardRating: 4.9,
                                CardReviews: 19,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Favorite_Card(
                                CardName: 'pyramids',
                                CardDate: '22 mai 2021 ',
                                CardRating: 4.9,
                                CardReviews: 19,
                              ),
                              Favorite_Card(
                                CardName: 'pyramids',
                                CardDate: '22 mai 2021',
                                CardRating: 4.9,
                                CardReviews: 19,
                              ),
                              Favorite_Card(
                                CardName: 'pyramids',
                                CardDate: '22 mai 2021',
                                CardRating: 4.9,
                                CardReviews: 19,
                              ),
                              Favorite_Card(
                                CardName: 'pyramids',
                                CardDate: '22 mai 2021',
                                CardRating: 4.9,
                                CardReviews: 19,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Favorite_Card(
                                CardName: 'pyramids',
                                CardDate: '22 mai 2021 ',
                                CardRating: 4.9,
                                CardReviews: 19,
                              ),
                              Favorite_Card(
                                CardName: 'pyramids',
                                CardDate: '22 mai 2021',
                                CardRating: 4.9,
                                CardReviews: 19,
                              ),
                              Favorite_Card(
                                CardName: 'pyramids',
                                CardDate: '22 mai 2021',
                                CardRating: 4.9,
                                CardReviews: 19,
                              ),
                              Favorite_Card(
                                CardName: 'pyramids',
                                CardDate: '22 mai 2021',
                                CardRating: 4.9,
                                CardReviews: 19,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
