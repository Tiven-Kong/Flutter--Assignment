import 'package:flutter/material.dart';
import 'package:micro2/quiz_app.dart';

 class WelcomeScreen extends StatelessWidget {
Function() welcome  ;
 WelcomeScreen({super.key ,required this.welcome });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SizedBox(
      width:double.infinity,
       child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Image.asset("assets/quiz-logo.png" ,color: Colors.blue, width:400 ,),
         SizedBox(height: 50,),

         Text("Crazy Quizz" , style: TextStyle(fontSize: 30),),
         SizedBox(height: 30,) ,
         SizedBox(
          width: 200,
           child: ElevatedButton(onPressed:welcome, child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Icon(Icons.arrow_forward_rounded ),
             Text("Start Quiz")
            ],
           )),
         )
        ],
       ),
     ),
    );
  }
}

