import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re7al/Widgets/MyAppBar.dart';
import 'package:re7al/data_models/user.dart';
import 'package:re7al/providers/auth_provider.dart';

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
    User user = Provider.of<AuthProvider>(context, listen: false).user;
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
                    child: CircleAvatar(
                        foregroundImage: user == null ? PpImg : user.imgUrl,
                        maxRadius: 50),
                  ),
                  accountName: GestureDetector(
                    child: Text(user == null ? 'Account Name' : user.name),
                    onTap: iconTap,
                  ),
                  accountEmail: GestureDetector(
                    child: Text(
                        user == null ? 'Account_Email@gmail.com' : user.email),
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
                        onTap: () async {
                          // Update the state of the app
                          // ...
                          // Then close the drawer
                          Provider.of<AuthProvider>(context, listen: false)
                              .logout();
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
