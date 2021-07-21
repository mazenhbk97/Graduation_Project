import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'Constants.dart';

class HS_Icons extends StatefulWidget {
  HS_Icons({
    this.HSicon,
    this.HScolor,
    this.HSnavigator,
    this.HSname,
  });

  Icon HSicon;
  Color HScolor;
  String HSname;
  final Function HSnavigator;
  @override
  _HS_IconsState createState() => _HS_IconsState();
}

class _HS_IconsState extends State<HS_Icons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          elevation: 2,
          borderRadius: BorderRadius.circular(15),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: IconButton(
              icon: widget.HSicon,
              iconSize: 50,
              color: widget.HScolor,
              onPressed: () {
                widget.HSnavigator();
              },
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          widget.HSname,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w900, color: font_color),
        ),
      ],
    );
  }
}
