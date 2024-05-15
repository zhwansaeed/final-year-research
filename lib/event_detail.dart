import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/event_model.dart';

class EventDetail extends StatelessWidget {
  final EventModel event;
  const EventDetail({super.key, required this.event});
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
              child: Image.asset(event.image, fit: BoxFit.contain)),
          Text(event.title,style: TextStyle(fontSize: 50),),
          SizedBox(height: 20,),
          Text(event.description.toString(),style: TextStyle(fontSize: 25),textDirection: TextDirection.rtl,),
          //  Text(event.description)
        ]));
  }
}
