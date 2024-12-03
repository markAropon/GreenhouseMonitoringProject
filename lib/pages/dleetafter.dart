import 'package:fab_circular_menu_plus/fab_circular_menu_plus.dart';
import 'package:flutter/material.dart';

class Dleetafter extends StatelessWidget {
  const Dleetafter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FabCircularMenuPlus(
        ringColor: Colors.blueAccent,
        ringWidth: 80,
        children: <Widget>[
          IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                print('Home');
              }),
          IconButton(
              icon: const Icon(Icons.favorite),
              onPressed: () {
                print('Favorite');
              })
        ],
      ),
    );
  }
}
