import 'package:flutter/material.dart';
import 'package:re7al/Widgets/Settings_LT.dart';

class Settings extends StatefulWidget {
  const Settings({Key key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isoff = false;
  bool pushnot() {
    isoff = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              color: Colors.blueGrey,
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.blueGrey),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
        child: ListView(
          children: [
            SwitchListTile(
              value: isoff,
              onChanged: (newValue) {
                setState(() {
                  isoff = newValue;
                });
              },
              title: Text('Push Notifications'),
              subtitle: Text(
                  'I would not miss it for the world, but if something else came up i would definitely not go'),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Settings_LT(
                TLtitle: 'Privacy&Terms',
                pushto: 'test',
              ),
            ),
            Settings_LT(
              TLtitle: 'General Settings',
              pushto: 'test',
            ),
            Settings_LT(
              TLtitle: 'Account Settings',
              pushto: 'UserProfile',
            ),
            Settings_LT(
              TLtitle: 'About Us',
              pushto: 'test',
            ),
            Settings_LT(
              TLtitle: 'Help!',
              pushto: 'test',
            ),
            Settings_LT(
              TLtitle: 'FeedBack',
              pushto: 'test',
            ),
          ],
        ),
      ),
    );
  }
}
