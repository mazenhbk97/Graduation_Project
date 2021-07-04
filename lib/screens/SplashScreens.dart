import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:re7al/Widgets/Constants.dart';
import 'package:re7al/screens/ExploreAlert.dart';

class SplashScreens extends StatefulWidget {
  _SplashScreensState createState() => new _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens> {
  @override
  Widget build(BuildContext context) {
    Widget carousel = new Carousel(
      autoplay: true,
      boxFit: BoxFit.fill,
      dotBgColor: Colors.transparent,
      images: [
        new AssetImage('images/bg.jpg'),
        new AssetImage('images/bg1.jpg'),
        new AssetImage('images/bg2.jpg'),
        new AssetImage('images/bg3.jpg'),
        new AssetImage('images/bg4.jpg'),
      ],
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: Duration(seconds: 1),
    );

    return SafeArea(
      child: new Scaffold(
        body: carousel,
        floatingActionButton: Container(
          height: 50,
          width: 110,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white54,
          ),
          child: FlatButton(
            child: Text(
              'Next ➔',
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.pushNamed(context, 'HomeScreen');
              showDialog<void>(
                  context: context, builder: (context) => ExploreAlert());
            },
          ),
        ),
      ),
    );
  }
}
