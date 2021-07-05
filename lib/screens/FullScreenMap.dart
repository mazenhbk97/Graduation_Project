import 'package:flutter/material.dart';
import 'dart:collection';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:re7al/Widgets/Constants.dart';

class FullScreenMap extends StatefulWidget {
  double lat, lang;
  FullScreenMap(this.lang, this.lat);
  @override
  _FullScreenMapState createState() => _FullScreenMapState();
}

class _FullScreenMapState extends State<FullScreenMap> {
  BitmapDescriptor CustomMarker;
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
    return Scaffold(
      body: GoogleMap(
        trafficEnabled: true,
        myLocationButtonEnabled: true,
        mapType: MapType.terrain,
        initialCameraPosition: CameraPosition(
            target: LatLng(currentlocation_lat, currentlocation_long),
            zoom: 14),
        onMapCreated: (GoogleMapController googleMapController) {
          setState(
            () {
              marker.add(
                Marker(
                  markerId: MarkerId('1'),
                  position: LatLng(currentlocation_lat, currentlocation_long),
                ),
              );
              marker.add(
                Marker(
                    markerId: MarkerId('2'),
                    position: LatLng(widget.lat, widget.lang)),
              );
            },
          );
        },
        markers: marker,
      ),
    );
  }
}
