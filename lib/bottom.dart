import 'package:flutter/material.dart';
//import 'package:flutter_application_1/admin.dart';

import 'package:flutter_application_1/eventpg.dart';
import 'package:flutter_application_1/homepg.dart';
import 'package:flutter_application_1/map.dart';
import 'package:flutter_application_1/model/place_model.dart';
import 'package:flutter_application_1/placepg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    homePage(),
    PlacePage(),
    Eventpg(),
    
   
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
            label: 'سەرەکی ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.place),
            label: 'گەڕان',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'ئیڤێنت',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.settings),
          //   label: 'سێتینگ',
          // ),
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
                builder: (context) => Map1(
                    place: PlaceModel(
                        id: 0,
                        englishTitle: "Not Selected",
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
