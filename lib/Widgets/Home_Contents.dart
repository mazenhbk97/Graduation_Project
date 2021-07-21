import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re7al/Models/city.dart';
import 'package:re7al/Widgets/Constants.dart';
import 'package:re7al/data_models/place.dart';
import 'package:re7al/helpers/servicesData.dart';
import 'package:re7al/providers/city_provider.dart';
import 'package:re7al/screens/ChooseCity.dart';
import 'package:re7al/screens/ExploreAlert.dart';
import 'package:re7al/screens/ExplorePlaces.dart';
import 'package:re7al/screens/SideMenu.dart';
import 'package:re7al/providers/places_provider.dart';

import 'HS_Icons.dart';
import 'MyAppBar.dart';
import 'Place_Card.dart';

class Home_Contents extends StatefulWidget {
  const Home_Contents({Key key}) : super(key: key);

  @override
  _Home_ContentsState createState() => _Home_ContentsState();
}

class _Home_ContentsState extends State<Home_Contents> {
  initState() {
    super.initState();
    Future.delayed(Duration.zero).then((_) async {
      await Provider.of<CityProvider>(context, listen: false).fetchCities();
    });
  }

  @override
  Widget build(BuildContext context) {
    City city = Provider.of<CityProvider>(context).selectedCity;
    print("build");

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: MyAppBar(
            MyABicon: Icon(
              Icons.menu_rounded,
              size: 40,
            ),
          ),
        ),
        drawer: SideMenu(),
        body: city == null
            ? ChooseCity()
            : FutureBuilder<List<PlaceModel>>(
                future: Provider.of<PlacesProvider>(context, listen: false)
                    .getCityPlaces(city.id),
                builder: (ctx, snapshot) => snapshot.connectionState ==
                        ConnectionState.waiting
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/bgcolor.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (ctx) => ExploreAlert());
                                      },
                                      child: Container(
                                        margin:
                                            EdgeInsets.only(top: 20, left: 15),
                                        child: Text(
                                          city == null
                                              ? 'Click to choose a city !'
                                              : "Welcome in",
                                          style: TextStyle(
                                              fontSize: 20, color: font_color),
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: city == null ? false : true,
                                      child: Container(
                                          margin: EdgeInsets.only(
                                              top: 20, right: 15, left: 15),
                                          child: GestureDetector(
                                            child: Text(
                                              city == null
                                                  ? ' '
                                                  : '${city.name}',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: font_color),
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 25, left: 15, bottom: 10),
                                      child: Text(
                                        'Type of services',
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: font_color,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 10, left: 10, right: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      HS_Icons(
                                          HSicon: Icon(Icons.museum_outlined),
                                          HScolor: Colors.blue,
                                          HSname: 'Tourism',
                                          HSnavigator: () =>
                                              goToExplore("Tourism")),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      HS_Icons(
                                        HSicon: Icon(Icons.restaurant_outlined),
                                        HScolor: Colors.purple,
                                        HSname: 'Food',
                                        HSnavigator: () => goToExplore("Food"),
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      HS_Icons(
                                        HSicon: Icon(Icons.local_hospital),
                                        HScolor: Colors.deepOrangeAccent,
                                        HSname: 'Hospital',
                                        HSnavigator: () =>
                                            goToExplore("Hospital"),
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      HS_Icons(
                                        HSicon: Icon(Icons.grass_rounded),
                                        HScolor: Colors.green,
                                        HSname: 'Clubs',
                                        HSnavigator: () => goToExplore("Club"),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 35,
                                        left: 15,
                                        bottom: 20,
                                      ),
                                      child: Text(
                                        'Best places ',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: font_color,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                    height: 500,
                                    child: Place_Card(snapshot.data)),
                              ],
                            ),
                          ),
                        ),
                      ),
              ));
  }

  void goToExplore(String filter) {
    Provider.of<PlacesProvider>(context, listen: false)
        .filterPlaces(servicesFilter[filter]);
    Navigator.of(context).pushNamed("ExplorePlaces");
  }
}
