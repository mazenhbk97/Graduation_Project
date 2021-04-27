import 'package:flutter/material.dart';

class MyNavigationBar extends StatefulWidget {
  MyNavigationBar({Key key}) : super(key: key);
  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int _selectedIndex = 0;

  void _onItemTap(int index) {
    setState(
      () {
        _selectedIndex = index;
      },
    );

    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/HomeScreen');
        break;
      case 1:
        Navigator.pushNamed(context, 'Favorites');
        break;
      case 2:
        Navigator.pushNamed(context, 'ExplorePlaces');
        break;
      case 3:
        Navigator.pushNamed(context, 'UserProfile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_sharp),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          label: 'Place',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      type: BottomNavigationBarType.shifting,
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      iconSize: 30,
      onTap: _onItemTap,
      elevation: 5,
    );
  }
}
