import 'package:bmi_calculator/constant.dart';
import 'package:flutter/material.dart';

class RepeatTextAndIconWidgets extends StatelessWidget {
  RepeatTextAndIconWidgets({required this.iconData, required this.label});
  final IconData iconData;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: 85.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: klabelstyle,
        ),
      ],
    );
  }
}
