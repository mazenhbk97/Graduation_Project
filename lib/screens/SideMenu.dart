import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:re7al/Widgets/MyAppBar.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key key}) : super(key: key);

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  void iconTap() {
    Navigator.pushNamed(context, 'UserProfile');
  }

  AssetImage PpImg = AssetImage('images/bestPlaces.png');

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // column holds all the widgets in the drawer
      child: Column(
        children: <Widget>[
          Expanded(
            // ListView contains a group of widgets that scroll inside the drawer
            child: ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  currentAccountPicture: GestureDetector(
                    onTap: iconTap,
                    child: CircleAvatar(foregroundImage: PpImg, maxRadius: 50),
                  ),
                  accountName: GestureDetector(
                    child: Text('Account Name'),
                    onTap: iconTap,
                  ),
                  accountEmail: GestureDetector(
                    child: Text('Account_Email@gmail.com'),
                    onTap: iconTap,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.home_outlined),
                  title: Text('Home'),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.notification_important_outlined),
                  title: Text('Notifications'),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pushNamed(context, 'Settings');
                  },
                  trailing: Icon(Icons.keyboard_arrow_right_outlined),
                ),
                ListTile(
                  leading: Icon(Icons.quick_contacts_dialer_outlined),
                  title: Text('Contact Us'),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.contact_support_outlined),
                  title: Text('FAQ'),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          // This container holds the align
          Container(
              // This align moves the children to the bottom
              child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  // This container holds all the children that will be aligned
                  // on the bottom and should not scroll with the above ListView
                  child: Container(
                      child: Column(
                    children: <Widget>[
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.logout),
                        title: Text('LogOut'),
                        onTap: () {
                          // Update the state of the app
                          // ...
                          // Then close the drawer
                          Navigator.pushNamed(context, 'Login');
                        },
                      ),
                    ],
                  ))))
        ],
      ),
    );
  }
}
