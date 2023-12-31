import 'package:bmi/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'screens/bmi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const BMI(),
    );
  }
}
