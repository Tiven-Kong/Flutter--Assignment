import 'package:flutter/material.dart';

enum Product {
  Dart,
  Flutter,
  Firebase;
  String tittle() {
    switch (this) {
      case Product.Dart:
        return "Dart";
      case Product.Flutter:
        return "Flutter";
      case Product.Firebase:
        return "Firebase";
    }
  }

  String decription() {
    switch (this) {
      case Product.Dart:
        return "The best Object Language";
      case Product.Flutter:
        return "The best Library";
      case Product.Firebase:
        return "The best cloud database";
    }
  }
  String Image() {
    switch (this) {
      case Product.Dart:
        return "assets/img/dart.png";
      case Product.Flutter:
        return "assets/img/flutter.png";
      case Product.Firebase:
        return "assets/img/firebase.png";
    }
  }
}// Fixed the enum name

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Ex2(Part1)'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Display(), // Ensure HomePage is defined below
    ),
  )); // Removed the semicolon before the closing bracket
}
class  Display extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
    children: [
      HomePage(product:Product.Dart),
      HomePage(product:Product.Flutter),
      HomePage(product:Product.Firebase),
    ]

    )
    );
  }
}



class HomePage extends StatelessWidget {
  final Product product ;


      HomePage({required this.product ,super.key});
@override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
              Card(
                child:Container(
                  width: 500,
                  height: 200,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("${product.Image()}" , width:100,),
                      Text("${product.tittle()}",style:TextStyle(fontSize: 30 , fontWeight: FontWeight.bold) ,),
                      Text("${product.decription()}" ,style: TextStyle(fontSize:15 ),)
                    ],
                  )

                )

              )

          ],
        ),
      );

  }
}
