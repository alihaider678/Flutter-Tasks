import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controller = TextEditingController();
  int randomNumber = Random().nextInt(100);
  String message;

  checkAnswer(int answerNumber) {
    setState(() {
      if (answerNumber == randomNumber) {
        message = 'It is $randomNumber, Congratulation!';
      } else if (answerNumber < randomNumber) {
        message = 'Incorrect!';
      } else {
        message = 'Try smaller number!';
      }
      controller.clear();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text("My GuessGame App"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: <Widget>[
            Text(
              'My number is in rage 0 - 50',
              style: TextStyle(fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(hintText: 'Enter your guess number'),
                keyboardType: TextInputType.number,
              ),
            ),
            Text(
              '$message',
              style: TextStyle(fontSize: 15),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: ElevatedButton(
                child: Text('Check'),
                onPressed: () {
                  checkAnswer(int.parse(controller.text));
                },
              ),
            )
          ],
        ),
      ),
    );
  }


  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}

