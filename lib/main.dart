import 'package:flutter/material.dart';
//import 'package:hello_cls_5/audio.dart';
//import 'package:hello_cls_5/calculator.dart';
import 'package:hello_cls_5/sampleCalculator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SampleCalculator(),
    );
  }
}
