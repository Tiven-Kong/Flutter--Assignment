
import 'package:flutter/material.dart';

void main(){

  runApp(MaterialApp(
    home: Week5(),
  ));


}
class  Week5 extends StatelessWidget {
   Week5({super.key});

  bool isFavorite = false;
IconData get icon=>isFavorite?Icons.favorite:Icons.favorite_outline ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Week5"),
      ),
      body:Container(
        child: Row(
               crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Expanded(

              child: Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sample Title',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'This is a sample description.',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            IconButton(

                icon: Icon(icon),
              onPressed: (){}
            ),



          ],

        ),
      ),
    );
  }
}

