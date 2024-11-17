import 'package:flutter/material.dart';
import 'joke.dart';

Color appColor = Colors.green[300] as Color;

void main() => runApp(MaterialApp(
  home: Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      backgroundColor: appColor,
      title: const Text("Favorite Jokes"),
    ),
    body: const FavoriteCard(),
  ),
));

class FavoriteCard extends StatefulWidget {
  const FavoriteCard({
    super.key,
  });

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  // Track the index of the selected favorite joke.
  int Favorite = -1;

  void onFavoriteCheck(int index) {
    setState(() {
      if (Favorite == index) {
        Favorite = -1;
      } else {
        Favorite = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: .5, color: Colors.grey),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Column(
        children: [
          SizedBox(
            height: 750,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: jokes.length,
              itemBuilder: (context, index) {
                var show = jokes[index];
                bool isFavorite=Favorite==index ;


                return Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: .5, color: Colors.grey),
                    ),
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(show["title"]!),
                          Text(show["joke"]!),
                        ],
                      ),
                      Expanded(child: SizedBox()),
                      IconButton(
                        onPressed: () => onFavoriteCheck(index),
                        icon: isFavorite
                            ? const Icon(Icons.favorite)
                            : const Icon(Icons.favorite_outline),
                        color: isFavorite ? Colors.redAccent : Colors.black,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
