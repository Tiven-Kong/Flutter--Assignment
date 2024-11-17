import 'package:flutter/material.dart';
void main() {
  runApp(MaterialApp(
    home: Container(
      color: Colors.blueAccent,
     
      child: Container(
        
        margin:const EdgeInsets.all(50),
        padding: const EdgeInsets.all(50),
        decoration:const  BoxDecoration( color: Color.fromARGB(255, 94, 123, 197),),
      child: const Center(
             child: Text("Hello Word" ,
             style: TextStyle(
              decoration:TextDecoration.none , 
              fontSize: 30
             ),
             
             
             ),
             
         
      ),
        // child:  Text(
        //   'Hello, World!',
        //   style: TextStyle(color: Colors.white, fontSize: 24),
        // ),
      ),
    ),
  ));
}
// class Home extends StatelessWidget {
//   const Home({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // color: Colors.red,
//       alignment: Alignment.center,
//       // width: 500,
//       // height: 60,
//       // padding: const EdgeInsets.all(10),
//       // margin: const EdgeInsets.all(50),
//       child: const Text(
//         "Hello  Flutter",
//         style: TextStyle(
//           fontSize: 30,
//           fontStyle: FontStyle.italic,
//           fontWeight: FontWeight.bold,
//           decoration: TextDecoration.none,
//         ),
//       ),
//     );
//   }
// }