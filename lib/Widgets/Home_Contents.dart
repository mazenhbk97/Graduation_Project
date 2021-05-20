import 'package:flutter/material.dart';
import 'package:re7al/Widgets/Constants.dart';
import 'package:re7al/screens/SideMenu.dart';

import 'HS_Icons.dart';
import 'MyAppBar.dart';
import 'Place_Card.dart';

class Home_Contents extends StatefulWidget {
  const Home_Contents({Key key}) : super(key: key);

  @override
  _Home_ContentsState createState() => _Home_ContentsState();
}

class _Home_ContentsState extends State<Home_Contents> {
  String CityName;
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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bgcolor.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 15),
                      child: Text(
                        'Welcome in ',
                        style: TextStyle(fontSize: 20, color: font_color),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 20, right: 15, left: 15),
                        child: GestureDetector(
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
                      padding: EdgeInsets.only(top: 25, left: 15, bottom: 10),
                      child: Text(
                        'Type of services',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: font_color,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      HS_Icons(
                        HSicon: Icon(Icons.museum_outlined),
                        HScolor: Colors.blue,
                        HSnavigator: 'test',
                        HSname: 'Tourism',
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      HS_Icons(
                        HSicon: Icon(Icons.restaurant_outlined),
                        HScolor: Colors.purple,
                        HSnavigator: 'test',
                        HSname: 'Food',
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      HS_Icons(
                        HSicon: Icon(Icons.local_hospital),
                        HScolor: Colors.deepOrangeAccent,
                        HSnavigator: 'Hospital',
                        HSname: 'Hospital',
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      HS_Icons(
                        HSicon: Icon(Icons.grass_rounded),
                        HScolor: Colors.green,
                        HSnavigator: 'ModalBottomSheet',
                        HSname: 'Clubs',
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 35,
                        left: 15,
                        bottom: 20,
                      ),
                      child: Text(
                        'Best places ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: font_color,
                        ),
                      ),
                    ),
                  ],
                ),
                Place_Card(),
                //Place_Card(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
