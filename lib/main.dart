import 'package:flutter/material.dart';
import 'package:flutter_application_1/add_location.dart';
import 'package:flutter_application_1/admin.dart';

import 'package:flutter_application_1/bottom2.dart';
import 'package:flutter_application_1/home2.dart';
import 'package:flutter_application_1/homepg.dart';
import 'package:flutter_application_1/language.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/splash.dart';



void main() => runApp( MaterialApp(
      home: LanguagePage(),
      debugShowCheckedModeBanner: false,
    ));

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
