import 'dart:collection';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map extends StatefulWidget {
  double lat, long;
  Map({this.lat, this.long});

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  getLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    print(position);
    setState(() {
      currentlocation_lat = position.latitude;
      currentlocation_long = position.longitude;
    });
    return position;
  }

  @override
  void initState() {
    // TODO: implement initState
    getLocation();
    super.initState();
  }

  var marker = HashSet<Marker>();
  double currentlocation_long;
  double currentlocation_lat;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'test');
      },
      child: Container(
        child: GoogleMap(
          mapType: MapType.terrain,
          initialCameraPosition: CameraPosition(
              target: LatLng(currentlocation_lat, currentlocation_long),
              zoom: 10),
          onMapCreated: (GoogleMapController googleMapController) {
            setState(
              () {
                marker.add(
                  Marker(
                      markerId: MarkerId('1'),
                      position:
                          LatLng(currentlocation_lat, currentlocation_long)),
                );
                marker.add(
                  Marker(
                      markerId: MarkerId('2'),
                      position: LatLng(widget.lat, widget.long)),
                );
              },
            );
          },
          markers: marker,
        ),
      ),
    );
  }
}
