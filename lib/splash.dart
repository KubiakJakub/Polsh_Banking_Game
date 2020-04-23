import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quizapp/home.dart';

class splashscreen extends StatefulWidget {
  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => homepage()
      ));
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xff04BF55),
      backgroundColor: Color(0xff36BF7F),
      body: Center(
        child: Text(
          "Quiz NBP",
          style: TextStyle(
            fontSize: 50.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
