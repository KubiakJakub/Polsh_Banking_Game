import 'package:flutter/material.dart';
import 'package:quizapp/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  static const greenColor = Color(0xff36BF7F);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz NBP',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: splashscreen(),
    );
  }
}

