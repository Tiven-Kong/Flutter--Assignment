import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(
home: Scaffold(
    backgroundColor:Colors.blueAccent,
   
   appBar: AppBar(
    title: const Text("Ex1"),
    backgroundColor: Colors.cyan,
    
  
  
   ),
   body: Center(
    child: Text("Hello bro " ,
    style:TextStyle(fontSize: 50) ,),
    
   ),
),
  ));
}