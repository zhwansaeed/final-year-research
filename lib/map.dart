import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/place_model.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class map_1 extends StatelessWidget {
  final PlaceModel place;
  var currentLatitude;
  var currentLongitude;

  map_1({Key? key, required this.place, this.currentLatitude = 35.566864 , this.currentLongitude = 45.416107}) : super(key: key);

  getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    this.currentLatitude = position.latitude;
    this.currentLongitude = position.longitude;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Map page"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
    body:FlutterMap(
      options: MapOptions(

        initialCenter: place.id != 0 && currentLatitude != null && currentLongitude != null ? LatLng(place.latitude, place.longitude) :  LatLng(currentLatitude, currentLongitude),
        initialZoom: 18,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.app',
        ),
        if (place.id != 0)
        MarkerLayer(
          markers: [
            Marker(
              point: LatLng(place.latitude, place.longitude),
              width: 80,
              height: 80,
              child: Image.asset("assets/location.png"),
            ),
          ],
        // RichAttributionWidget(
        //   attributions: [
        //     TextSourceAttribution(
        //       'OpenStreetMap contributors',
        //       onTap: () => launch(Uri.parse('https://openstreetmap.org/copyright')),
        //     ),
        //   ],
        // ),
        )],
    ));
  }
}