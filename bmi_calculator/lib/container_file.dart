import 'package:flutter/material.dart';
class RepeatContainerCode extends StatelessWidget {
  RepeatContainerCode({required this.colors, required this.CardWidget});
  final Color colors;
  final Widget CardWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colors,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}