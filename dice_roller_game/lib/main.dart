import 'dart:math';

import 'package:dice_roller_game/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DiceGame());
}

class DiceGame extends StatefulWidget {
  @override
  _DiceGameState createState() => _DiceGameState();
}

class _DiceGameState extends State<DiceGame> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.deepOrangeAccent.shade100,
        appBar: AppBar(
          title: Text('Dice Roller Game'),
          backgroundColor: Colors.blue.shade900,
          centerTitle: true,
        ),
        body: Home(),
      ),
    );
  }
}