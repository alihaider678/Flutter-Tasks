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
  int first = 1;
  int second = 1;
  int third = 1;
  int fourth = 1;
  int p1score = 0;
  int p2score = 0;
  int p3score = 0;
  int p4score = 0;
  bool p1 = true;
  bool p2 = false;
  bool p3 = false;
  bool p4 = false;
  dynamic roll = 10;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.yellow,
        appBar: AppBar(
          title: Text('4 player Dice game',
          style: TextStyle(color: Colors.white),),
          // backgroundColor: Colors.teal[200],
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ROLL Count Left',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                  fontFamily: 'Orbitron',
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(height: 12),
              TextButton(
                onPressed: () {
                  setState(() {
                    p1score = 0;
                    p2score = 0;
                    p3score = 0;
                    p4score = 0;
                    roll = 10;
                    p1 = true;
                    p2 = false;
                    p3 = false;
                    p4 = false;
                    first = 1;
                    second = 1;
                    fourth = 1;
                    fourth = 1;
                  });
                },
                child: Text(
                  '$roll',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Orbitron',
                    letterSpacing: 2.0,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: p1
                          ? () {
                        setState(() {
                          first = Random().nextInt(6) + 1;
                          p1score += first;
                        });
                        p1 = false;
                        p2 = true;
                        p3 = false;
                        p4 = false;
                      }
                          : null,
                      child: Image.asset(
                        'images/dice$first.png',
                        //color: Colors.red,
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: p2
                          ? () {
                        setState(() {
                          roll -= 1;
                          if (roll > 0) {
                            second = Random().nextInt(6) + 1;
                            p2score += second;
                            print('I am executed');
                            p3 = true;
                          } else {
                            second = Random().nextInt(6) + 1;
                            p2score += second;
                            print('I am executed');
                            p1 = false;
                            p2 = false;
                            p3 = false;
                            p4 = false;
                            if (p1score > p2score) {
                              roll = 'Player 1 won replay';
                            } else if (p2score == p1score) {
                              roll = 'Drawn';
                            } else {
                              roll = 'Player 2 won,  replay!';
                            }
                          }
                        });
                        p2 = false;
                      }
                          : null,
                      child: Image.asset(
                        'images/dice$second.png',
                        //color: Colors.green,
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 22),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Center(
                        child: Text(
                          '$p1score',
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'Orbitron',
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Center(
                        child: Text(
                          '$p2score',
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'Orbitron',
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 22),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Center(
                        child: Text(
                          'P 1',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'Orbitron',
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Center(
                        child: Text(
                          'P 2',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'Orbitron',
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 22),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: p3
                          ? () {
                        setState(() {
                          third = Random().nextInt(6) + 1;
                          p3score += third;
                        });
                        p1 = false;
                        p2 = false;
                        p3 = false;
                        p4 = true;
                      }
                          : null,
                      child: Image.asset(
                        'images/dice$third.png',
                       // color: Colors.blue,
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: p4
                          ? () {
                        setState(() {
                          fourth = Random().nextInt(6) + 1;
                          p4score += fourth;
                        });
                        p1 = true;
                        p2 = false;
                        p3 = false;
                        p4 = false;
                      }
                          : null,
                      child: Image.asset(
                        'images/dice$fourth.png',
                       // color: Colors.yellow,
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 22),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Center(
                        child: Text(
                          '$p3score',
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'Orbitron',
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Center(
                        child: Text(
                          '$p4score',
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'Orbitron',
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 22),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Center(
                        child: Text(
                          'P 3',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'Orbitron',
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Center(
                        child: Text(
                          'P 4',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'Orbitron',
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 6.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}