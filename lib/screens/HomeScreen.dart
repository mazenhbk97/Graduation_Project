import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:re7al/Models/MyNavigationBar.dart';
import 'package:re7al/Models/Places.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      body: SafeArea(
        child: Container(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              Container(
                child: Column(
                  children: [
                    //SearchBar(),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20, right: 15, left: 15),
                          child: Text(
                            'Welcome in  CityName',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(top: 25, left: 15, bottom: 10),
                          child: Text(
                            'Type of services',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            children: [
                              Material(
                                elevation: 5,
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    //color: Colors.white
                                  ),
                                  child: IconButton(
                                    //SvgPicture.asset('svg/museum.png'
                                    icon: Icon(Icons.museum_outlined),
                                    iconSize: 40,
                                    color: Colors.deepPurpleAccent,
                                    onPressed: () {
                                      Navigator.pushNamed(context, 'Museums');
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Tourist',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w900),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Column(
                            children: [
                              Material(
                                elevation: 5,
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white),
                                  child: IconButton(
                                    icon: Icon(Icons.restaurant),
                                    iconSize: 40,
                                    color: Colors.purpleAccent,
                                    onPressed: () {
                                      Navigator.pushNamed(context, 'test');
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Food',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w900),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Column(
                            children: [
                              Material(
                                elevation: 5,
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white),
                                  child: IconButton(
                                    icon: Icon(Icons.local_hospital),
                                    iconSize: 40,
                                    color: Colors.redAccent,
                                    onPressed: () {
                                      Navigator.pushNamed(context, 'Hospital');
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Hospital',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w900),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Column(
                            children: [
                              Material(
                                elevation: 5,
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white),
                                  child: IconButton(
                                    icon: Icon(Icons.sports),
                                    iconSize: 40,
                                    color: Colors.green,
                                    onPressed: () {
                                      Navigator.pushNamed(context, 'Clubs');
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Clubs',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w900),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 45,
                            left: 15,
                            bottom: 20,
                          ),
                          child: Text(
                            'Best places ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Places(),
                    Places(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyNavigationBar(),
    );
  }
}
