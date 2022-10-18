import 'package:flutter/material.dart';
import 'dart:math';

class Display extends StatefulWidget {

  int i,f;

  Display({this.i,this.f}) {}
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DisplayState(i: i,f: f);
  }

}

class DisplayState extends State<Display> {

  int i,f;
  int value;

  DisplayState({this.i,this.f}) {
    var rand = new Random();
    if(i.toInt() == f.toInt()) {
      value = i.toInt();
      return ;
    }
    value =  i.toInt() + rand.nextInt(f.toInt() - i.toInt());

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child:Container(
          width: 300,
          height: 300,
          color: Colors.amber,
          child: Center(
            child: Text(
              value.toString(),
              style: TextStyle(
                fontSize: 100.0,
                color: Colors.black,
              ),
            ),
          ),
        )
      ),
      floatingActionButton: ButtonBar(
        alignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          FloatingActionButton(
            heroTag: "1",
            child: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          FloatingActionButton(
            heroTag: "2",
            child: Icon(Icons.replay),
            onPressed: () {
              generateRandomNumber();
            },
          ),
        ],
      )
    );
  }

  void generateRandomNumber() {
    var rand = new Random();

    setState(() {
      if(i.toInt() == f.toInt()) {
        value = i.toInt();
        return ;
      }
      value =  i.toInt() + rand.nextInt(f.toInt() - i.toInt()+1);
    });
  }

}