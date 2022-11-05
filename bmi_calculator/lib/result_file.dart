import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/container_file.dart';
import 'package:flutter/material.dart';

import 'input_page.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen(
      {required this.bmiResult,
        required this.interpretation,
        required this.resultText});
  final String bmiResult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Result'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  child: Text(
                    'Your Result',
                    style: kTitleStyleS2,
                  ),
                ),
              )),
          Expanded(
            child: RepeatContainerCode(
              colors: activeColor,
              CardWidget: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: kResultText,
                  ),
                  Text(
                    bmiResult,
                    style: kBMiTextStyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kbodyTextStyle,
                  )
                ],
              ),
              onPressed: () {},
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => InputPage()));
            },
            child: Container(
              child: const Center(
                  child: Text(
                    'Re-Calculate',
                    style: kLargeButtonStyle,
                  )),
              color: const Color(0xFFEB1555),
              margin: const EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: 80.0,
            ),
          ),
        ],
      ),
    );
  }
}
