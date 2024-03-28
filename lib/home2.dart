import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class homePage2 extends StatefulWidget {
  const homePage2({super.key});

  @override
  State<homePage2> createState() => _homePageState();
}

class _homePageState extends State<homePage2> {
  final List<String> imageList = [
    "assets/home/p1.png",
    "assets/home/p2.png",
    "assets/home/p3.png",
    "assets/home/p4.png",
    "assets/home/p5.png",
    "assets/home/p6.png",
    "assets/home/p7.png",
    "assets/home/p8.png",
    "assets/home/p9.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min, // Use min to wrap content in column direction
      children: <Widget>[
        CarouselSlider(
          items: imageList.map((item) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(item),
                fit: BoxFit.cover,
              ),
            ),
          )).toList(),
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
          ),
        ),
        const SizedBox(height: 20), // Optional spacing between carousel and text
        const Text("""
       Sulaymaniyah is a city located in southern Kurdistan. It was founded by Ibrahim Pasha of Baban on November 14, When he moved the capital of his empire from Ardalan to Sulaymaniyah.
After the 1991 uprising, it has expanded and developed significantly, and is now known as one of the quietest and cleanest cities in Iraq. As a result, many people from southern Iraq move to the city, making it a refuge for citizens from southern Iraq, Iran and other regions.
Since its establishment, the city has been attempted to be conquered several times by the Persians during the Pahlavi period.
  Sulaimani has Dukan Dam, which is one of the largest dams in Iraq, and has several beautiful resorts such as: [Ahmad Awa - Hawramabad - Dukan Dam - Goyzha Mountain - Kunamasi - Karadag - Sachnar and Zewe],
,and many other areas.
In terms of art, literature and poets' conference, it is known as the capital of culture. Hundreds of great poets and writers such as Piramird, Nali, Salim, Kurdi, Sherko Bekas, Goran, Mahvi, Amin Zaki Beg, Dr. Mohammed Kamal are located there.""",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          textAlign: TextAlign.left, // Aligns text to the right
          textDirection: TextDirection.ltr, // Ensures text flows from right to left
        ),
        // You can add more widgets here if needed
      ],
    );
  }
}
