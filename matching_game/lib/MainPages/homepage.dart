import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:number_maching/MainPages/gamestart.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState()=>_HomePageState();
}

class _HomePageState extends State<HomePage>{

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          )
        ],
        centerTitle: true,
        backgroundColor: Colors.blue.shade900,
        title: Text('Matching Game'),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/homescreen/bg.png'),
                fit: BoxFit.cover)),
        child: Center(
          child:
          Container(
            height: size.height*0.1,
            width: size.width*0.5,
            child: ElevatedButton(
                onPressed: () {
                  Get.to(() =>GameView());
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),),
                  side: BorderSide(color: Colors.transparent),
                  backgroundColor: Colors.amber,
                ),
                child: Text(
                  "Start Game",
                  style: TextStyle(color: Colors.white,),
                )),
          ),
        ),
      ),
    );
  }

}
