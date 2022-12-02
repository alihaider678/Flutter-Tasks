import 'package:flutter/material.dart';

import './ui/climate_file.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Climate(),
      ),
    ),
  );
}