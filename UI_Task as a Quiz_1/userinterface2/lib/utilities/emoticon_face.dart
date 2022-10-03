import 'package:flutter/material.dart';
class EmoticonFace extends StatelessWidget {
  final String emoticonFace;
  const EmoticonFace({
    Key? key,
  required this.emoticonFace,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(5),
      child: Center(
        child: Text(
          emoticonFace,
      style: TextStyle(
        fontSize: 28,
      ),
      ),
      ),
    );
  }
}
