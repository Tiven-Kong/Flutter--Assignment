import 'package:flutter/material.dart';
import 'package:view/Button.dart';
void main() {
  runApp(MaterialApp(
    home:Scaffold(
        appBar:AppBar(
      title: Text("Ex1"),
          backgroundColor: Colors.brown,


  ),
      body:Column(
      children: [
        Part2(HobbyTittle: "telegram", icon: Icons.telegram),
        Part2(HobbyTittle: "facebook", icon: Icons.facebook),
        Part2(HobbyTittle: "tiktok", icon: Icons.tiktok,)
å
      ],
    ),
  ),
  ),
  );
}

class Part2 extends StatelessWidget {
  String HobbyTittle ;
  IconData icon ;
  Color backGround ;
  Part2({required this.HobbyTittle , required this.icon , this.backGround=Colors.blue}) ;

  @override
  Widget build(BuildContext context) {
    return Container(

      child:
      Container(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Container(
                margin: EdgeInsets.fromLTRB(40, 40, 40, 0),

                child:Container(
                  decoration:  BoxDecoration(color:backGround , borderRadius:BorderRadius.circular(20) , ) ,

                  child: Center(
                    child: Row(
                      children:[
                        Container(
                          padding: EdgeInsets.fromLTRB(30, 20, 20, 20),
                          child: Icon(

                            icon,   // Choose an icon
                            color: Colors.white,    // Set the icon color
                            size: 50.0,

                          ),

                        ),
                        Text("Search",

                          style: TextStyle(fontWeight: FontWeight.bold , color:Colors.white,
                          ),
                        ),

                      ],
                    ),
                  ),

                )) ,



          ],

        ),
      ),
    );

  }
}
