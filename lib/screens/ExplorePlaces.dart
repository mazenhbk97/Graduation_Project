import 'package:flutter/material.dart';
import 'package:re7al/Models/MyNavigationBar.dart';
import 'package:re7al/Models/Places.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ExplorePlaces extends StatefulWidget {
  @override
  _ExplorePlacesState createState() => _ExplorePlacesState();
}

class _ExplorePlacesState extends State<ExplorePlaces> {
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20, right: 15, left: 15),
                  child: Text(
                    'Welcome in  CityName',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 15, bottom: 10),
                  child: Text(
                    'Nearest Places',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            CarouselSlider(
              options: CarouselOptions(
                initialPage: 4,
                height: 160,
                viewportFraction: 0.66,
              ),
              items: [
                Story(),
                Story(),
                Story(),
                Story(),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 45,
                    left: 15,
                    bottom: 0,
                  ),
                  child: Text(
                    'Best places ',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Places(),
            Places(),
            Places(),
          ],
        ),
      ),
      bottomNavigationBar: MyNavigationBar(),
    );
  }
}
