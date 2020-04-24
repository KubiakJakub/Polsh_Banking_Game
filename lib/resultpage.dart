import 'package:flutter/material.dart';
import 'package:quizapp/home.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class resultpage extends StatefulWidget {
  int points;
  resultpage({Key key, @required this.points}) : super(key : key);
  @override
  _resultpageState createState() => _resultpageState(points);
}

class _resultpageState extends State<resultpage> {
// =============== U S E R   D E F I N E D   V E R I A B L E S ===============
  List<String> images = [
    "images/great.jpg",
    "images/no_bad.jpg",
    "images/bad.jpg"
  ];
  String message;   // Wiadomość przy wyniku
  String image;   // Grafika przy wyniku
  int points;    // liczba zdobytych punktów
  String result;


  _resultpageState(this.points);
//  // =============== C U S T O M    F U N C T I O N S ===============
  @override
  void initState(){
    if(points < 10){
      image = images[2];
      message = "\"Nawet szczęśliwe numery nie zawsze wygrywają.\" ~ J.R.R Tolkien\n";
      result = "\nWynik: $points";
    }else if(points < 17){
      image = images[1];
      message = "\"Jutrzejsze bitwy wygrywa się dzisiejszą pracą\" ~ Mohamed Hanif\n";
      result = "\nWynik: $points";
    }else{
      image = images[0];
      message = "\"Być zwyciężonym i nie ulec to zwycięstwo, zwyciężyć i spocząć na laurach – to klęska\" ~ Józef Piłsudski\n";
      result = "\nWynik: $points";
    }
    super.initState();
  }

// =============== W I D G E  T S ===============
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text(
//          "Result",
//        ),
//      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 10,
            child: Material(
              elevation: 0.0,
              child: Container(
                child: Column(
                  children: <Widget>[
                    Material(
                      child: Container(
                        margin: const EdgeInsets.only(top: 30.0),
                        width: 800.w,
                        height: 800.h,
                        child: ClipRect(
                          child: Image(
                            image:  AssetImage(

                              image
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 15.0,
                      ),
                      child: Center(
                        child: Text(
                          message + result,
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(70),
                            fontFamily: 'Lato-Regular',
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlineButton(
                  onPressed: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => homepage()
                    ));
                  },
                  child: Text(
                    "Kontynuuj ",
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(60),
                      letterSpacing: 1.5,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 50.w,
                    horizontal: 65.h,
                  ),
                  borderSide: BorderSide(width: 2.0, color: Color(0xff36BF7F)),
                  splashColor: Color(0xff36BF7F),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}
