import 'package:flutter/material.dart';
import 'package:re7al/Models/Places.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:re7al/Widgets/Constants.dart';
import 'package:re7al/Widgets/MyAppBar.dart';
import 'package:re7al/Widgets/Place_Card.dart';
import 'package:re7al/Widgets/Place_StoryCard.dart';
import 'package:re7al/screens/SideMenu.dart';
import 'package:re7al/screens/ExploreAlert.dart';

class ExplorePlaces extends StatefulWidget {
  @override
  _ExplorePlacesState createState() => _ExplorePlacesState();
}

class _ExplorePlacesState extends State<ExplorePlaces> {
  String CityName;
  dialogalert() {
    showDialog<void>(context: context, builder: (context) => ExploreAlert());
  }

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
      drawer: SideMenu(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20, left: 15),
                  child: Text(
                    'Welcome in ',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 20, right: 15, left: 15),
                    child: GestureDetector(
                      onTap: dialogalert,
                      child: Text(
                        '$CityName',
                        style: TextStyle(fontSize: 20, color: font_color),
                      ),
                    )),
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
                      color: font_color,
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
                      color: font_color,
                    ),
                  ),
                ),
              ],
            ),
            Place_Card(),
            Place_Card(),
            Place_Card(),
          ],
        ),
      ),
    );
  }
}
