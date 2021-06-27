import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:re7al/Widgets/Constants.dart';
import 'package:re7al/Widgets/Home_Contents.dart';
import 'package:re7al/screens/Favorites.dart';
import 'ExplorePlaces.dart';
import 'Favorites.dart';
import 'UserProfile.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int CurrentIndex = 2;
  List<Widget> screens = [
    Home_Contents(),
    Favorites(),
    ExplorePlaces(),
    UserProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.8),
      child: Scaffold(
        body: screens[CurrentIndex],
        extendBodyBehindAppBar: true,
        extendBody: true,
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: CurrentIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: (index) {
              setState(() {
                CurrentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  child: Chip(
                    avatar: Icon(
                      Icons.home_outlined,
                      color: CurrentIndex == 0 ? Colors.white : font_color,
                    ),
                    label: CurrentIndex == 0
                        ? Text(
                            'Home',
                            style: TextStyle(color: Colors.white),
                          )
                        : Text(''),
                    backgroundColor:
                        CurrentIndex == 0 ? bottom_nav_bar : Colors.transparent,
                  ),
                ),
                //label: '',
                title: new Text(''),
              ),
              BottomNavigationBarItem(
                icon: Chip(
                  avatar: Icon(
                    Icons.favorite_border_outlined,
                    color: CurrentIndex == 1 ? Colors.white : font_color,
                  ),
                  label: CurrentIndex == 1
                      ? Text(
                          'Fav',
                          style: TextStyle(color: Colors.white),
                        )
                      : Text(''),
                  backgroundColor:
                      CurrentIndex == 1 ? bottom_nav_bar : Colors.transparent,
                ),
                title: new Text(''),
              ),
              BottomNavigationBarItem(
                icon: Chip(
                  avatar: Icon(
                    Icons.explore_outlined,
                    color: CurrentIndex == 2 ? Colors.white : font_color,
                  ),
                  label: CurrentIndex == 2
                      ? Text(
                          'Explore',
                          style: TextStyle(color: Colors.white),
                        )
                      : Text(''),
                  backgroundColor:
                      CurrentIndex == 2 ? bottom_nav_bar : Colors.transparent,
                ),
                title: new Text(''),
              ),
              BottomNavigationBarItem(
                icon: Chip(
                  avatar: Icon(
                    Icons.person_outline_rounded,
                    color: CurrentIndex == 3 ? Colors.white : font_color,
                  ),
                  label: CurrentIndex == 3
                      ? Text(
                          'Profile',
                          style: TextStyle(color: Colors.white),
                        )
                      : Text(''),
                  backgroundColor:
                      CurrentIndex == 3 ? bottom_nav_bar : Colors.transparent,
                ),
                title: new Text(''),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
