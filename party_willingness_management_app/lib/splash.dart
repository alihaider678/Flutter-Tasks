import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:party/home.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SplashScreenView(
        navigateRoute: Home(),
        duration: 10000,
        imageSize: 200,
        imageSrc: "assets/bg1.png",
        backgroundColor: Colors.teal.shade50,
        text: "Party Willingness App",
        textType: TextType.ColorizeAnimationText,
        colors: [
          Colors.purple,
          Colors.blue,
          Colors.yellow,
          Colors.red,
        ],
        textStyle: TextStyle(
          fontSize: 24.0,
        ),
      ),
    );
  }
}
