import 'package:first/EXERCISE-1/EXERCISE-3/screen/temperature.dart';
import 'package:first/EXERCISE-1/EXERCISE-3/screen/welcome.dart';
import 'package:flutter/material.dart';

class TemperatureApp extends StatefulWidget {
  const TemperatureApp({super.key});

  @override
  State<TemperatureApp> createState() => _TemperatureAppState();
}

class _TemperatureAppState extends State<TemperatureApp> {
  bool isWelcome = true;

  void change(){
    setState(() {
      isWelcome =!isWelcome ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff16C062),
                Color(0xff00BCDC),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child:isWelcome?
          Welcome(click:change):
          Temperature(),
        ),
      ),
    );
  }
}

void main() {
  runApp(const TemperatureApp());
}
