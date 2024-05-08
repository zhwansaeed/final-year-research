import 'package:flutter/material.dart';

import 'package:flutter_application_1/bottom2.dart';
import 'package:flutter_application_1/language.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/splash.dart';



void main() => runApp(const MaterialApp(
      home: Login_page(),
      debugShowCheckedModeBanner: false,
    ));

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
