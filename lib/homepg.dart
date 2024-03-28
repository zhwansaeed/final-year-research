import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
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
        سلێمانی شارێكە دەكەوێتە باشووری كودستانەوە.لەلایەن ئیبراهیم پاشای بابان لە ۱٤ی تیشرینی دووەمی  ساڵی ۱۷۸٤ سلێمانی دامەزراوە. كاتێك پایتەختی میرنشینەكەی لە ئەردەڵانەوە گواستۆتەوە بۆ سلێمانی.
لە پاش ڕاپەڕینی ۱۹۹۱ فراوانبوون و پێشكەوتنێكی بەرچاوی بە خۆیەوە بینووە  ،كە ئێستا وەك یەكێك لە شارە هێمن و خاوێنەكان لە عێراق بە ناوبانگە. بەوو هۆیەوە خەڵكانێكی زۆر لە ناووچەكانی خوارووی عێراق ڕووی تێدەكەن، بەووە بە پەناگەی ئەو هاوڵاتیانەی  كە لە خوارووی عێراق و ئێرانەوە  و ناوچەكانی دیكە ڕوو دەكەنە شارەكە.
ئەم شارە لە سەرەتای دامەزراندنییەوە چەندین جار هەوڵی داگیرکردنی دراوە لەلایەن فارسەكانەوە كە لە ماوەی سەردمی پەهلەوویەكاندا داگیر كراوە.
 سلێمانی  بەنداوی دوكان'ی هەیە كە یەكێكە لە گەورەترین بەداوەكانی عێراق ، وە چەندین  هاوینەهەواری جوانی هەیە وەك:[ئەحمەد ئاوا ـ هەورامان ـ بەنداوی دوكان ـ چییای گۆیژە ـ كونەماسی ـ قەرەداغ ـ سەچنار و زێوێ]،
،وە چەندین ناوچەی دیكە.
لە ڕووی هونەر و ئەدەبیات و كۆڕی شاعیران لە پێشڕەویدایە كە بە پایتەختی ڕۆشنبیری ناسراوە ،سەدان شاعیر و گەورە نووسەرانی  تێدا هەڵكەوتووە وەك:(پیرەمێرد ـ نالی _ سالم ـ كوردی ـ شێركۆ بێكەس ـ گۆران ـ مەحوی ـ ئەمین زەكی بەگ دكتۆر محەمەد كەمال).
        """,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          textAlign: TextAlign.right, // Aligns text to the right
          textDirection: TextDirection.rtl, // Ensures text flows from right to left
        ),
        // You can add more widgets here if needed
      ],
    );
  }
}
