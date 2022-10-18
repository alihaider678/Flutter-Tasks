import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main.dart';


class SplashScreen extends StatefulWidget{
  @override
  _SplashScreenState createState()=>_SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(milliseconds: 1000),(){
      Get.to(HomePage());
    });
  }
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child:
          Image.asset('assets/splash.jpg',width:1000,height:1000,),
        ),
      ),
    );
  }

}
