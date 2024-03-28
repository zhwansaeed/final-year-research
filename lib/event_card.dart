import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/event_model.dart';
import 'package:flutter_application_1/constant.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.event, required this.press});

  final EventModel event;
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
              tag: "${event.id}",
              child: Image.asset(event.image),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 8),
              child: Text(
                event.title,
                style: const TextStyle(color: kTextLightColor),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: Text(
              "\$${event.description}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
