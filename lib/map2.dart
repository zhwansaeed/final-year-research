import 'package:flutter/material.dart';
import 'package:flutter_application_1/database/place_repository.dart';
import 'package:flutter_application_1/model/place_model.dart';
import 'package:flutter_application_1/model/placemodel.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_application_1/database/account_singleton.dart';

class map_2 extends StatefulWidget {
  final PlaceModel place;
  var currentLatitude;
  var currentLongitude;


  map_2({Key? key, required this.place, this.currentLatitude = 35.566864, this.currentLongitude = 45.416107})
      : super(key: key);

  @override
  _Map1State createState() => _Map1State();
}

class _Map1State extends State<map_2> {
  double rating = 0;


  void getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      widget.currentLatitude = position.latitude;
      widget.currentLongitude = position.longitude;
    });
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  void submitFeedback() async {
    var singletonAccount = SingletonAccount.instance;

    String accountEmail = singletonAccount.email;

    PlaceRepository placeRepository = await PlaceRepository.create();
    placeRepository.addFeedback(widget.place, accountEmail, rating.toInt());
    // Implement your logic to handle the submitted feedback here
    print("Rating: $rating");
    // You can add further logic like sending feedback to a server, etc.

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
      body: Column(
        children: [
          Expanded(
            child: FlutterMap(
              options: MapOptions(
                initialCenter: widget.place.id != 0 && widget.currentLatitude != null && widget.currentLongitude != null
                    ? LatLng(widget.place.latitude, widget.place.longitude)
                    : LatLng(widget.currentLatitude, widget.currentLongitude),
                initialZoom: 18,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
                if (widget.place.id != 0)
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: LatLng(widget.place.latitude, widget.place.longitude),
                        width: 80,
                        height: 80,
                        child: Image.asset("assets/location.png"),
                      ),
                    ],
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                RatingBar.builder(
                  initialRating: rating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemSize: 40,
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (newRating) {
                    setState(() {
                      rating = newRating;
                    });
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: submitFeedback,
                  child: Text('Submit Feedback'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
