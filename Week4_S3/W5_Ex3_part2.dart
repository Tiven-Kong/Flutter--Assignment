import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    home: Week5(),
    debugShowCheckedModeBanner: false,
  ));
}

class Week5 extends StatefulWidget {
  const Week5({super.key});

  @override
  State<Week5> createState() => _Week5State();
}

class _Week5State extends State<Week5> {
int image_index = 0 ;

void click(){
  setState(() {
    image_index=(image_index+1)%3 ;
  });
}
void co() {
  setState(() {
    image_index = (image_index +2) % 3;
  });
}

Widget getImage(){
  switch(image_index){
    case 1 :
     return  Image.asset("assets/img/medium.webp") ;
    case 2 :
      return Image.asset("assets/img/Glass.png") ;
    default:
      return Image.asset("assets/img/Ex3pic.webp");



  }
}







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,

          children: [
            IconButton(onPressed:co, icon: Icon(Icons.arrow_left)),
            IconButton(onPressed:click, icon: Icon(Icons.arrow_right)),
          ],
        ),
      ),
      body: Container(
        child: getImage(),
      ),
    );
  }
}