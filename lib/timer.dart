import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(Timer());
}

class Timer extends StatefulWidget {
  @override
  State<Timer> createState() => _MyAppState();
}

class _MyAppState extends State<Timer> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Display Time'),
        ),
        body: Center(
          child: Text(
            'Current Time: ${DateFormat.Hms().format(DateTime.now())}',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}