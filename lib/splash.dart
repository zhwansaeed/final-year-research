import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_application_1/language.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/signup.dart';


class SplashSC extends StatefulWidget {
  const SplashSC({super.key});

  @override
  State<SplashSC> createState() => _SplashSCState();
}

class _SplashSCState extends State<SplashSC> {
  var distance = 0.0;
  var start = 0.0;
  var end = 300.0;
  var traveled = 0.0;

  @override
  void initState() {
    super.initState();
    interpolate(start, end);
    Timer.periodic(Duration(milliseconds: 45), moveCar);
    //bo awa abet ka shanu wifi saraway appaka bsharetawa 
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  @override
  void dispose() {
    //bo away dway splash bgaretawa bary asaiy xoi 
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  void moveCar(Timer t) async {
    if (distance < end) {
      setState(() {
        distance += traveled;
      });
    } else {
      t.cancel();
      navigateToLoginScreen(); // Add this line to navigate after animation
    }
  }

  void interpolate(double start, double end) {
    setState(() {
      traveled = (end - start) / 60;
    });
  }

  void navigateToLoginScreen() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                Login_page())); // Ensure your login screen is named correctly
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [Colors.lightGreen, Colors.lightBlue],
      )),
      //margin: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
              margin: EdgeInsets.only(right: distance),
              child: const Text('🗺️', style: TextStyle(fontSize: 130))),
        ], //🚗
      ),
    ));
  }
}
