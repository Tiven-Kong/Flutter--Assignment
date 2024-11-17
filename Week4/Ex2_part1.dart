import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title:const Text('Ex2(Part1)'),
        backgroundColor: Colors.blueAccent

      ),
      body:
      Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              width: 500, // Set the width of the card
              height: 180,
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [


                    Image.asset('assets/img/dart.png' ,width: 100,height:100,),
                    Container(
                      padding: EdgeInsets.only(left: 30),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                    Text("Dart" , style: TextStyle(fontWeight: FontWeight.bold ),) ,
                    Text("The best Object Language" , style: TextStyle(fontWeight: FontWeight.bold,)),
                     ] ),)
                     ],

                ),
              ),
            ),
            Container(
              width: 500, // Set the width of the card
              height: 180,
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [


                    Image.asset('assets/img/flutter.png' ,width: 100,height:100,),
                    Container(
                      padding: EdgeInsets.only(left: 30),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text("Dart" , style: TextStyle(fontWeight: FontWeight.bold ),) ,
                            Text("The best Framwork of dart" , style: TextStyle(fontWeight: FontWeight.bold,)),
                          ] ),)
                  ],

                ),
              ),
            ),
            Container(
              width: 500, // Set the width of the card
              height: 180,
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [


                    Image.asset('assets/img/firebase.png' ,width: 100,height:100,),
                    Container(
                      padding: EdgeInsets.only(left: 30),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text("Firebast" , style: TextStyle(fontWeight: FontWeight.bold ),) ,
                            Text("The best Clound Database" , style: TextStyle(fontWeight: FontWeight.bold,)),
                          ] ),)
                  ],

                ),
              ),
            )
          ],


        ),

      ),
    ),
  ));
}