import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re7al/Widgets/Constants.dart';
import 'package:re7al/Widgets/Favorite_Card.dart';
import 'package:re7al/Widgets/MyAppBar.dart';
import 'package:re7al/Widgets/Place_Card.dart';
import 'package:re7al/data_models/place.dart';
import 'package:re7al/providers/places_provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: bk_color,
          body: Padding(
            padding: EdgeInsets.only(top: 20, right: 20, left: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'My Saved ',
                      style: TextStyle(
                          fontSize: 30,
                          color: font_color,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.favorite_border_outlined,
                      size: 30,
                      color: font_color,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Material(
                    borderRadius: BorderRadius.circular(50),
                    elevation: 5,
                    child: TabBar(
                      indicator: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      tabs: [
                        Tab(
                          child: Text(
                            'OverlAll',
                            style: TextStyle(color: font_color),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Highly Rated',
                            style: TextStyle(color: font_color),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'New',
                            style: TextStyle(color: font_color),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      SavedPlaces('Overall'),
                      SavedPlaces("rate"),
                      SavedPlaces('new'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SavedPlaces extends StatefulWidget {
  String urlSeg;
  SavedPlaces(this.urlSeg);

  @override
  _SavedPlacesState createState() => _SavedPlacesState();
}

class _SavedPlacesState extends State<SavedPlaces> {
  var isLoading = false;
  initState() {
    super.initState();
    Future.delayed(Duration.zero).then((_) async {
      setState(() {
        isLoading = true;
      });
      await Provider.of<PlacesProvider>(context, listen: false)
          .getSavedPlaces(widget.urlSeg);

      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Selector<PlacesProvider, List<PlaceModel>>(
                  selector: (context, placesPrv) => placesPrv.savedPlaces,
                  builder: (context, savedPlaces, _) =>
                      savedPlaces.isEmpty || savedPlaces == null
                          ? Center(
                              child: Text("Go add some places !"),
                            )
                          : Column(
                              children: savedPlaces
                                  .map((e) => Favorite_Card(
                                        place: e,
                                      ))
                                  .toList())),
        ));
  }
}
