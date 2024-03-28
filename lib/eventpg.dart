import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/database/account_repository.dart';
import 'package:flutter_application_1/database/account_singleton.dart';
import 'package:flutter_application_1/event_detail.dart';
import 'package:flutter_application_1/model/event_model.dart';

class Eventpg extends StatefulWidget {
  const Eventpg({super.key});

  @override
  State<Eventpg> createState() => _EventpgState();
}

class _EventpgState extends State<Eventpg> {

  SingletonAccount singletonAccount = SingletonAccount.instance;



  @override
  void initState() {
    super.initState();
    // Initially sort events
    sortEvents();
  }

  Future<void> toggleFavoriteEvent(event) async{
    AccountRepository accountRepository = await AccountRepository.create();

    bool contains = false;

    for(var i = 0; i < singletonAccount.favoriteEvents.length; i++) {
      if(singletonAccount.favoriteEvents[i] == event.id.toString()) {
        contains = true;
      }
    }


    if(contains) {
      accountRepository.removeEvent(singletonAccount.email, event.id);
      singletonAccount.favoriteEvents.remove(event.id.toString());

    } else {
      accountRepository.addEvent(singletonAccount.email, event);
      singletonAccount.favoriteEvents.add(event.id.toString());
    }

    sortEvents();


  }

  // Define a method to sort events based on favorites
  void sortEvents() {
    setState(() {
      events.sort((a, b) {
        bool isAFavorite = singletonAccount.favoriteEvents.contains(a.id.toString());
        bool isBFavorite = singletonAccount.favoriteEvents.contains(b.id.toString());
        if (isAFavorite && !isBFavorite) {
          return -1; // a before b
        } else if (!isAFavorite && isBFavorite) {
          return 1; // b before a
        }
        return 0; // keep original order if both are favorites or both are not
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ئیڤێنت',
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
          final EventModel event =
              events[index]; // Replace with your actual data source
          return Card(
              child: ListTile(
                trailing: IconButton(onPressed:() async {
                    await toggleFavoriteEvent(event);
                    setState(() {});
                }, icon: SingletonAccount.instance.favoriteEvents.contains(event.id.toString()) ? Icon(Icons.favorite) : Icon(Icons.favorite_border_outlined)),

            title: Text(
              event.title,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
            ),
            leading: SizedBox(
              width: 65,
              height: 60,
              child: Image.asset(event.image),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => EventDetail(event: event)));
            },
          ));
        },
      ),
    );
  }
}
