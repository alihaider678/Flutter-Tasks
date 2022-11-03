import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/container_file.dart';
import 'package:flutter/material.dart';
import 'constant.dart';
import 'input_page.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

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
              child: Container(
            child: const Center(
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Normal',
                  style: kResultText,
                ),
                Text(
                  '18.3',
                  style: kBMiTextStyle,
                ),
                Text(
                  'BMI is Low you should have to work more',
                  textAlign: TextAlign.center,
                  style: kbodyTextStyle,
                )
              ],
            ),
            onPressed: () {},
          ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>InputPage()));
            },
            child: Container(
              child: const Center(
                  child: Text(
                    'Recalculate',
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
