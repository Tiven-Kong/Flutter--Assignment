
import 'package:flutter/material.dart';

void main(){

  runApp(MaterialApp(
    home: Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Column(
        children: [
          Week5() ,
          SizedBox(height: 20,),
          Week5() ,
          SizedBox(height: 20,),
          Week5() ,
          SizedBox(height: 20,),
        ],
      ),
    )
  ));

}

class Week5 extends StatefulWidget {
  const Week5({super.key});

  @override
  State<Week5> createState() => _Week5State();
}

class _Week5State extends State<Week5> {
  bool Selected= true;
  void Check(){
    setState(() {
      Selected = !Selected ;
    });

  }
  get Background=>Selected?Colors.blue:Colors.white ;
  get TextColor=>Selected?Colors.white:Colors.black ;
  get ShowText=>Selected?"Selected":"Not Selected" ;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          width: 400,
          height:100,
          
          child: ElevatedButton(onPressed:Check,style: ElevatedButton.styleFrom(backgroundColor: Background),
              child:Container(
            child: Text("$ShowText", style: TextStyle(color: TextColor),),
          ))
        ),
    );



  }
}
