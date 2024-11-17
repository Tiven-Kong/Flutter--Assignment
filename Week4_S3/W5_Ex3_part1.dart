
import 'package:flutter/material.dart';
import 'package:view/Button.dart';

void main(){

  runApp(MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: Colors.blue,
          title: Text("Favorite Card"),
        ),
        body:Column(
          children: [
            Week5() ,
            Week5() ,
            Week5() ,
          ],
        )
      )

  ),
  );


}
class  Week5 extends StatefulWidget {

  @override
  State<Week5> createState() => _Week5State();
}

class _Week5State extends State<Week5> {
  bool isFavorite = true ;


  void change(){
    setState(() {
      isFavorite = !isFavorite ;
    });
  }


  Icon get toggle {
    if(isFavorite){
      return Icon(Icons.favorite ,color: Colors.red,) ;
    }
    else{
      return Icon(Icons.favorite_outline ,color:Colors.black,) ;
    }
  }



  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(

          child: Column(
            children: [
              Row(
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
                      icon:toggle,
                      onPressed:change

                  ),


                ],


              ),



            ],
          ),
        ),
      );
  }
}

