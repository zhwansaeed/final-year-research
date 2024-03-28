import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/database/account_repository.dart';
import 'package:flutter_application_1/database/account_singleton.dart';

import 'package:flutter_application_1/eventdetail2.dart';
import 'package:flutter_application_1/model/event_model.dart';
import 'package:flutter_application_1/model/eventmodel.dart';

class Eventpg2 extends StatefulWidget {
  const Eventpg2({super.key});

  @override
  State<Eventpg2> createState() => _EventpgState();
}

class _EventpgState extends State<Eventpg2> {
  SingletonAccount singletonAccount = SingletonAccount.instance;

  Future<void> toggleFavoriteEvent(event2) async{
    AccountRepository accountRepository = await AccountRepository.create();

    if(!singletonAccount.favoriteEvents.contains(event2.title)) {
      accountRepository.addEvent2(singletonAccount.email, event2);
    } else {
      accountRepository.removeEvent(singletonAccount.email, event2.title);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Event',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        shadowColor: Colors.lightBlue,
        elevation: 10,
        backgroundColor: Colors.white10,
        actions: const [
          SizedBox(
            width: 5,
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      //backgroundColor: const Color.fromARGB(255, 233, 236, 238),
      backgroundColor: Colors.lightBlue.shade100,
      body: ListView.builder(
        itemCount: events.length, // Replace with the length of your data list
        itemBuilder: (BuildContext context, int index) {
          final EventModel2 event2 =
              event[index]; // Replace with your actual data source
          return Card(
              child: ListTile(
            trailing: IconButton(
                onPressed: () {
                  toggleFavoriteEvent(event2);
                }, icon: SingletonAccount.instance.favoritePlaces.contains(event2.title) ? Icon(Icons.favorite) : Icon(Icons.favorite_border_outlined)),
            title: Text(
              event2.title,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
            ),
            leading: SizedBox(
              width: 65,
              height: 60,
              child: Image.asset(event2.image),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => EventDetail2(event2: event2)));
            },
          ));
        },
      ),
    );
  }
}
