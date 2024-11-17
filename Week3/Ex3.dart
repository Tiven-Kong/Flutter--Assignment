import 'package:flutter/material.dart';
void main() {
  runApp(MaterialApp(
    home: Container(
      color: Colors.blueAccent,
     
      child: Column(
        
        children: [
          Container(
             padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.fromLTRB(10, 70, 10, 10), // Margin around the container
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 94, 123, 197),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: const Center(
              child: Text(
                "OOP",
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
             padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(10),// Margin around the container
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 153, 176, 233),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: const Center(
              child: Text(
                "Dart",
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
             padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(10), // Margin around the container
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 20, 77, 221),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: const Center(
              child: Text(
                "Flutter",
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  ));
}