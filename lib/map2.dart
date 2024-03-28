import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/placemodel.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class map_2 extends StatelessWidget {
  final PlaceModel22 place22;
  const map_2({Key? key, required this.place22}) : super(key: key);

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
        body: FlutterMap(
          options: MapOptions(
            initialCenter: place22.id == 0
                ? LatLng(35.566864, 45.416107)
                : LatLng(place22.latitude, place22.longitude),
            initialZoom: 18,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.app',
            ),
            if (place22.id != 0)
              MarkerLayer(
                markers: [
                  Marker(
                    point: LatLng(place22.latitude, place22.longitude),
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
              )
          ],
        ));
  }
}
