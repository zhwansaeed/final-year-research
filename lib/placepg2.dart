import 'package:flutter/material.dart';
import 'package:flutter_application_1/map2.dart';
import 'package:flutter_application_1/model/place_model.dart';
import 'package:flutter_application_1/model/placemodel.dart';


class placePage2 extends StatefulWidget {
  const placePage2({super.key});

  @override
  State<placePage2> createState() => _placePageState();
}

class _placePageState extends State<placePage2> {

  @override
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
