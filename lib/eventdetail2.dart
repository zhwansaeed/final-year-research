import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/eventmodel.dart';

class EventDetail2 extends StatelessWidget {
  final EventModel2 event2;
  const EventDetail2({super.key, required this.event2});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(''),
        ),
        body: Column(children: [
          SizedBox(
              width: 200,
              height: 200,
              child: Image.asset(event2.image, fit: BoxFit.contain)),
          Text(event2.title),
          Text(event2.description.toString()),
          //  Text(event.description)
        ]));
  }
}
