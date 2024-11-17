import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main(){
  runApp(MaterialApp(
    home:Bonus()
    ),
  );

}

class  Bonus extends StatelessWidget {
@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.lightGreen[100],
    body: const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
              scoreCard(title: "Flutter Point ") ,
               SizedBox(height: 30,) ,
               scoreCard(title: "Dart") ,
               SizedBox(height: 30,) ,
               scoreCard(title: "React",)
        ],
      ),
    ),
  );
}
}

class scoreCard extends StatefulWidget {
  final String title ;
  const scoreCard({super.key , required this.title,});


  @override
  State<scoreCard> createState() => _scoreCardState();
}

class _scoreCardState extends State<scoreCard> {

  int score = 0;
  void increase(){
   setState(() {
    if(score < 10 ){
      score++ ;
    }
   });
  }
  void decrease(){
    setState(() {
      if(score > 1 ){
        score-- ;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:const BoxDecoration(color: Colors.white70) ,
         child: Padding(
           padding: const EdgeInsets.only(top: 30 , bottom: 30),
           child: Column(
             children: [
               Text(
                 widget.title,
                 style: GoogleFonts.abyssinicaSil(),
               ),

               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Row(
                     children: [


                   IconButton(onPressed: decrease, icon:Icon(Icons.remove)) ,
                   Container(

                     decoration:BoxDecoration(
                       border: Border.all(
                         color: Colors.black,  // Set the border color
                         width:1,
                         // Optional: set the border width
                       ),),
                      child: Container(
                        width:  score *29,
                        decoration:BoxDecoration(
                          border: Border.all(
                            color: Colors.green,  // Set the border color
                            width: 15,

                            // Optional: set the border width
                          ),),
                      ),
                   ) ,

                 ],),
                   Container
                     (child: IconButton(onPressed: increase, icon: Icon(Icons.add)))
                 ],
               )
             ],
           ),
         )
          ) ; 

  }
}




