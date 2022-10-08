import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(DiceGame());
}

class DiceGame extends StatefulWidget {
  @override
  _DiceGameState createState() => _DiceGameState();
}

class _DiceGameState extends State<DiceGame> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  int bottomleftDiceNumber = 1;
  int bottomrightDiceNumber = 1;
  int playerOneScore = 0;
  int playerTwoScore = 0;
  int playerThreeScore = 0;
  int playerFourScore = 0;
  dynamic turnsLeft = 10;

  bool p1IsEnabled = true;
  bool p2IsEnabled = false;
  bool p3IsEnabled = false;
  bool p4IsEnabled = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //backgroundColor: Colors.blue.shade900,
        appBar: AppBar(
          title: Text('Dice Roller Game'),
          backgroundColor: Colors.blue.shade900,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(15.0),
                      child: Center(
                        child: Text(
                          '$playerOneScore',
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(15.0),
                      child: Center(
                        child: Text(
                          '$playerTwoScore',
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(15.0),
                      child: Center(
                        child: Text(
                          'Abdullah',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(15.0),
                      child: Center(
                        child: Text(
                          'Ali',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: p1IsEnabled
                          ? () {
                        setState(() {
                          leftDiceNumber = Random().nextInt(6) + 1;
                          playerOneScore += leftDiceNumber;
                        });
                        p1IsEnabled = false;
                        p2IsEnabled = true;
                        p3IsEnabled = false;
                        p4IsEnabled = false;
                      }
                          : null,
                      child: Image.asset(
                        'assets/images/Dice $leftDiceNumber.png',
                        width: 120,
                        height: 120,
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: p2IsEnabled
                          ? () {
                        setState(() {
                          turnsLeft -= 1;
                          if (turnsLeft > 0) {
                            rightDiceNumber = Random().nextInt(6) + 1;
                            playerTwoScore += rightDiceNumber;
                            print('I am executed');
                            p3IsEnabled = true;
                          } else {
                            rightDiceNumber = Random().nextInt(6) + 1;
                            playerTwoScore += rightDiceNumber;
                            print('I am executed');
                            p1IsEnabled = false;
                            p2IsEnabled = false;
                            p3IsEnabled = false;
                            p4IsEnabled = false;
                            if (playerOneScore > playerTwoScore) {
                              turnsLeft = ' won, tap to play again!';
                            } else if (playerTwoScore == playerOneScore) {
                              turnsLeft = 'Drawn, tap to replay!';
                            } else {
                              turnsLeft = 'Ali won, tap to play again!';
                            }
                          }
                        });
                        p2IsEnabled = false;
                      }
                          : null,
                      child: Image.asset(
                        'assets/images/Dice $rightDiceNumber.png',
                        width: 120,
                        height: 120,
                        //color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(5.0),
                      child: Center(
                        child: Text(
                          '$playerThreeScore',
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade900,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(5.0),
                      child: Center(
                        child: Text(
                          '$playerFourScore',
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(15.0),
                      child: Center(
                        child: Text(
                          'Usman',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade900,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(15.0),
                      child: Center(
                        child: Text(
                          'Zeeshan',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: p3IsEnabled
                          ? () {
                        setState(() {
                          bottomleftDiceNumber = Random().nextInt(6) + 1;
                          playerThreeScore += bottomleftDiceNumber;
                        });
                        p1IsEnabled = false;
                        p2IsEnabled = false;
                        p3IsEnabled = false;
                        p4IsEnabled = true;
                      }
                          : null,
                      child: Image.asset(
                        'assets/images/Dice $bottomleftDiceNumber.png',
                        width: 120,
                        height: 120,
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: p4IsEnabled
                          ? () {
                        setState(() {
                          bottomrightDiceNumber = Random().nextInt(6) + 1;
                          playerFourScore += bottomrightDiceNumber;
                        });
                        p1IsEnabled = true;
                        p2IsEnabled = false;
                        p3IsEnabled = false;
                        p4IsEnabled = false;
                      }
                          : null,
                      child: Image.asset(
                        'assets/images/Dice $bottomrightDiceNumber.png',
                        width: 120,
                        height: 120,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                'Rolled Left',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900,
                  letterSpacing: 2.0,
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    playerOneScore = 0;
                    playerTwoScore = 0;
                    playerThreeScore = 0;
                    playerFourScore = 0;
                    turnsLeft = 10;
                    p1IsEnabled = true;
                    p2IsEnabled = false;
                    p3IsEnabled = false;
                    p4IsEnabled = false;
                    leftDiceNumber = 1;
                    rightDiceNumber = 1;
                    bottomrightDiceNumber = 1;
                    bottomrightDiceNumber = 1;
                  });
                },
                child: Text(
                  '$turnsLeft',
                  style: TextStyle(
                    color: Colors.blue.shade900,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}