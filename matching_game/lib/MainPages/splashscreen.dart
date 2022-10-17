import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:number_maching/MainPages/homepage.dart';

class SplashScreen extends StatefulWidget{
  @override
  _SplashScreenState createState()=>_SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 4),(){
      Get.to(() =>HomePage());
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
          Image.asset('assets/splashscreen/COMSATS.jpg',width:size.height*0.2,height:size.height*0.3,),

        ),
      ),
    );
  }

}
