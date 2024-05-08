import 'package:flutter/material.dart';
import 'package:flutter_application_1/admin2.dart';
import 'package:flutter_application_1/event2.dart';
import 'package:flutter_application_1/home2.dart';
import 'package:flutter_application_1/map2.dart';
import 'package:flutter_application_1/model/place_model.dart';
import 'package:flutter_application_1/placepg2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Navigation Bar Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage2(),
    );
  }
}

class MyHomePage2 extends StatefulWidget {
  const MyHomePage2({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage2> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    homePage2(),
    PlacePage2(),
    Eventpg2(),
    admin2()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        //child: _widgetOptions.elementAt(_selectedIndex),
        child: _widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.blue,
        unselectedLabelStyle: TextStyle(color: Colors.blue),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.place),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Event',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlue.shade200,
        onPressed: () {},
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => map_2(
                    place: PlaceModel(
                        id: 0,
                        englishTitle: "Not selected",
                        kurdishTitle: "Not Selected",
                        latitude: 0,
                        longitude: 0,
                        image: "there is no image",
                        averageRating: 0,
                        feedbacks: [])),
              ),
            );
          },
          child: const Icon(
            Icons.location_on,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
