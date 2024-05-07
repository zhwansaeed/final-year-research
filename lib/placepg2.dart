import 'package:flutter/material.dart';
import 'package:flutter_application_1/database/account_repository.dart';
import 'package:flutter_application_1/database/account_singleton.dart';
import 'package:flutter_application_1/map2.dart';
import 'package:flutter_application_1/model/place_model.dart';
import 'package:flutter_application_1/model/placemodel.dart';


class placePage2 extends StatefulWidget {
  const placePage2({super.key});

  @override
  State<placePage2> createState() => _placePageState();
}

class _placePageState extends State<placePage2> {
  SingletonAccount singletonAccount = SingletonAccount.instance;

  @override
  void initState() {
    super.initState();
    // Initially sort places
    sortPlaces();
  }

  Future<void> toggleFavoritePlace(place22) async{
    AccountRepository accountRepository = await AccountRepository.create();

    bool contains = false;

    for(var i = 0; i < singletonAccount.favoritePlaces.length; i++) {
      if(singletonAccount.favoritePlaces[i] == place22.id.toString()) {
        contains = true;
      }
    }


    if(contains) {
      accountRepository.removePlace(singletonAccount.email, place22.id);
      singletonAccount.favoritePlaces.remove(place22.id.toString());

    } else {
      accountRepository.addPlace(singletonAccount.email, place22);
      singletonAccount.favoritePlaces.add(place22.id.toString());
    }

    sortPlaces();


  }

  // Define a method to sort places based on favorites
  void sortPlaces() {
    setState(() {
      place1.sort((a, b) {
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


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        title: const Text(
          'Explore',
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
      //backgroundColor: const Color.fromARGB(255, 233, 236, 238),
      backgroundColor: Colors.lightBlue.shade100,
      body: ListView.builder(
        itemCount: places.length, // Replace with the length of your data list
        itemBuilder: (BuildContext context, int index) {
          final PlaceModel22 place22 =
              place1[index]; // Replace with your actual data source
          return Card(
              child: ListTile(
            trailing: IconButton(
              onPressed: () {
                
              },
              icon: Icon(Icons.favorite_border_outlined),
            ),
            title: Text(
              place22.title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
              textAlign: TextAlign.left,
              textDirection: TextDirection.ltr,
            ),
            leading: SizedBox(
              width: 66,
              height: 60,
              child: Image.asset(
                place22.image,
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => map_2(place22: place22)));
            },
          ));
        },
      ),
    );
  }
}
