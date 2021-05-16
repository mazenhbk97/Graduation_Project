import 'package:flutter/material.dart';

class Settings_LT extends StatefulWidget {
  Settings_LT({
    this.TLtitle,
    this.pushto,
  });
  String TLtitle;
  String pushto;

  @override
  _Settings_LTState createState() => _Settings_LTState();
}

class _Settings_LTState extends State<Settings_LT> {
  void iconTap(String pushto) {
    Navigator.pushNamed(context, pushto);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.TLtitle),
      onTap: () {
        // Update the state of the app
        // ...
        // Then close the drawer
        iconTap(widget.pushto);
      },
      trailing: Icon(Icons.keyboard_arrow_right_outlined),
    );
  }
}
