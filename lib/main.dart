import 'package:flutter/material.dart';
import 'package:flutter_application_1/clock.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Clock(),
    );
  }
}
