import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:re7al/Widgets/Constants.dart';
import 'package:re7al/Widgets/Home_Contents.dart';
import 'package:re7al/providers/auth_provider.dart';
import 'package:re7al/screens/Favorites.dart';
import 'package:re7al/screens/Login.dart';
import 'package:re7al/screens/UserProfile.dart';
import 'ExplorePlaces.dart';
import 'Favorites.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  initState() {
    Future.delayed(Duration.zero).then((_) async =>
        Provider.of<AuthProvider>(context, listen: false).tryAutoLogIn());
    super.initState();
  }

  int currentIndex = 0;
  List<Widget> screens = [
    Home_Contents(),
    Favorites(),
    ExplorePlaces(),
    UserProfile()
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.8),
      child: Scaffold(
        body: screens[currentIndex],
        extendBodyBehindAppBar: true,
        extendBody: true,
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  child: Chip(
                    avatar: Icon(
                      Icons.home_outlined,
                      color: currentIndex == 0 ? Colors.white : font_color,
                    ),
                    label: currentIndex == 0
                        ? Text(
                            'Home',
                            style: TextStyle(color: Colors.white),
                          )
                        : Text(''),
                    backgroundColor:
                        currentIndex == 0 ? bottom_nav_bar : Colors.transparent,
                  ),
                ),
                //label: '',
                title: new Text(''),
              ),
              BottomNavigationBarItem(
                icon: Chip(
                  avatar: Icon(
                    Icons.favorite_border_outlined,
                    color: currentIndex == 1 ? Colors.white : font_color,
                  ),
                  label: currentIndex == 1
                      ? Text(
                          'Fav',
                          style: TextStyle(color: Colors.white),
                        )
                      : Text(''),
                  backgroundColor:
                      currentIndex == 1 ? bottom_nav_bar : Colors.transparent,
                ),
                title: new Text(''),
              ),
              BottomNavigationBarItem(
                icon: Chip(
                  avatar: Icon(
                    Icons.explore_outlined,
                    color: currentIndex == 2 ? Colors.white : font_color,
                  ),
                  label: currentIndex == 2
                      ? Text(
                          'Explore',
                          style: TextStyle(color: Colors.white),
                        )
                      : Text(''),
                  backgroundColor:
                      currentIndex == 2 ? bottom_nav_bar : Colors.transparent,
                ),
                title: new Text(''),
              ),
              BottomNavigationBarItem(
                icon: Chip(
                  avatar: Icon(
                    Icons.person_outline_rounded,
                    color: currentIndex == 3 ? Colors.white : font_color,
                  ),
                  label: currentIndex == 3
                      ? Text(
                          'Profile',
                          style: TextStyle(color: Colors.white),
                        )
                      : Text(''),
                  backgroundColor:
                      currentIndex == 3 ? bottom_nav_bar : Colors.transparent,
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
