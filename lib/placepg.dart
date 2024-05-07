import 'package:flutter/material.dart';
import 'package:flutter_application_1/database/account_repository.dart';
import 'package:flutter_application_1/database/account_singleton.dart';
import 'package:flutter_application_1/map.dart';
import 'package:flutter_application_1/model/place_model.dart';

class placePage extends StatefulWidget {
  const placePage({super.key});

  @override
  State<placePage> createState() => _placePageState();
}

class _placePageState extends State<placePage> {

  SingletonAccount singletonAccount = SingletonAccount.instance;

  @override
  void initState() {
    super.initState();
    // Initially sort places
    sortPlaces();
  }

  Future<void> toggleFavoritePlace(place) async{
    AccountRepository accountRepository = await AccountRepository.create();

    bool contains = false;

    for(var i = 0; i < singletonAccount.favoritePlaces.length; i++) {
      if(singletonAccount.favoritePlaces[i] == place.id.toString()) {
        contains = true;
      }
    }


    if(contains) {
      accountRepository.removePlace(singletonAccount.email, place.id);
      singletonAccount.favoritePlaces.remove(place.id.toString());

    } else {
      accountRepository.addPlace(singletonAccount.email, place);
      singletonAccount.favoritePlaces.add(place.id.toString());
    }

    sortPlaces();


  }

  // Define a method to sort places based on favorites
  void sortPlaces() {
    setState(() {
      places.sort((a, b) {
        bool isAFavorite = singletonAccount.favoritePlaces.contains(a.id.toString());
        bool isBFavorite = singletonAccount.favoritePlaces.contains(b.id.toString());
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
        backgroundColor: Colors.white10,
        title: const Text(
          'گەڕان',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
        shadowColor: Colors.lightBlue,
        elevation: 15,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        actions: const [
          SizedBox(
            width: 5,
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      backgroundColor: Colors.lightBlue.shade100,
      body: ListView.builder(
        itemCount: places.length, // Replace with the length of your data list
        itemBuilder: (BuildContext context, int index) {
          final PlaceModel place =
              places[index]; // Replace with your actual data source
          return Card(
              child: ListTile(
            trailing: IconButton(
              onPressed: () async {
                await toggleFavoritePlace(place);
                setState(() {});
              },
              icon: SingletonAccount.instance.favoritePlaces.contains(place.id.toString()) ? Icon(Icons.favorite) : Icon(Icons.favorite_border_outlined),
            ),
            title: Text(
              place.title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
            ),
            leading: SizedBox(
              width: 50,
              height: 50,
              child: Image.asset(place.image),
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Map1(place: place)));
            },
          ));
        },
      ),
    );
  }
}
