import 'package:flutter/material.dart';
import 'package:flutter_application_1/database/account_repository.dart';
import 'package:flutter_application_1/database/account_singleton.dart';
import 'package:flutter_application_1/database/place_repository.dart';
import 'package:flutter_application_1/map.dart';
import 'package:flutter_application_1/model/place_model.dart';

class PlacePage2 extends StatefulWidget {
  const PlacePage2({super.key});

  @override
  State<PlacePage2> createState() => _PlacePageState();
}

class _PlacePageState extends State<PlacePage2> {
  SingletonAccount singletonAccount = SingletonAccount.instance;
  List<PlaceModel> places = []; // Initialize this with your initial place data

  @override
  void initState() {
    super.initState();
    loadPlaces(); // Load places asynchronously at the start
  }

  Future<void> loadPlaces() async {
    PlaceRepository placeRepository = await PlaceRepository.create();

    // place akan bena ba pey away feedbacky zortrin la sarawa bet dwatr la xwarawa
    // disan sort akainawa am jara favorite akan abaina sarawa grng nia chanek feedbackyan haya kam yan zor
    List<PlaceModel> loadedPlaces = await placeRepository.getListBasedOnFeedback();

    setState(() {
      places = loadedPlaces;
      sortPlaces(); // Sort after loading places
    });
  }

  Future<void> toggleFavoritePlace(PlaceModel place) async {
    AccountRepository accountRepository = await AccountRepository.create();

    if (singletonAccount.favoritePlaces.contains(place.id.toString())) {
      await accountRepository.removePlace(singletonAccount.email, place.id);
      singletonAccount.favoritePlaces.remove(place.id.toString());
    } else {
      await accountRepository.addPlace(singletonAccount.email, place);
      singletonAccount.favoritePlaces.add(place.id.toString());
    }

    setState(() {
      sortPlaces();
    });
  }

  // place akan sort ka yakamjar ba pey favorite dwatr ba pey average rating
  void sortPlaces() {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        title: const Text('Explore', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800)),
        centerTitle: true,
        shadowColor: Colors.lightBlue,
        elevation: 15,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      backgroundColor: Colors.lightBlue.shade100,
      body: ListView.builder(
        itemCount: places.length,
        itemBuilder: (BuildContext context, int index) {
          final PlaceModel place = places[index];
          return Card(
            child: ListTile(
              trailing: IconButton(
                onPressed: () async {
                  await toggleFavoritePlace(place);
                },
                icon: Icon(singletonAccount.favoritePlaces.contains(place.id.toString()) ? Icons.favorite : Icons.favorite_border_outlined),
              ),
              title: Text(
                place.englishTitle,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                textAlign: TextAlign.left,
                textDirection: TextDirection.ltr,
              ),
              leading: SizedBox(
                width: 50,
                height: 50,
                child: Image.asset(place.image),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Map1(place: place)));
              },
            ),
          );
        },
      ),
    );
  }
}


