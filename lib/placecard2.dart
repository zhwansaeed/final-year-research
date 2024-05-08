import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant.dart';
import 'package:flutter_application_1/model/place_model.dart';

class ItemCard2 extends StatelessWidget {
  const ItemCard2({super.key, required this.place, required this.press});

  final PlaceModel place;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(kDefaultPaddin / 2),
            margin: const EdgeInsets.only(left: 10),
            child: Hero(
              tag: "${place.id}",
              child: Image.asset(place.image),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 8),
              child: Text(
                place.englishTitle,
                style: const TextStyle(color: kTextLightColor),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: const Text(
              "Map here",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
