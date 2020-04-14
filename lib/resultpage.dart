import 'package:flutter/material.dart';
import 'package:quizapp/home.dart';

class resultpage extends StatefulWidget {
  int points;
  resultpage({Key key, @required this.points}) : super(key : key);
  @override
  _resultpageState createState() => _resultpageState(points);
}

class _resultpageState extends State<resultpage> {
// =============== U S E R   D E F I N E D   V E R I A B L E S ===============
  List<String> images = [
    "images/image.png",
    "images/image.png",
    "images/image.png"
  ];
  String message;   // Wiadomość przy wyniku
  String image;   // Grafika przy wyniku
  int points;    // liczba zdobytych punktów


  _resultpageState(this.points);
//  // =============== C U S T O M    F U N C T I O N S ===============
  @override
  void initState(){
    if(points < 10){
      image = images[2];
      message = "Failure is success in progress\n" +
          "Your score: $points";
    }else if(points < 17){
      image = images[1];
      message = "Not Bad! Mistakes are the portals of discovery\n" +
          "Your score: $points";
    }else{
      image = images[0];
      message = "Great! Success isn’t permanent and failure isn’t fatal\n" +
          "Your score: $points";
    }
    super.initState();
  }

// =============== W I D G E  T S ===============
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Result",
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 10,
            child: Material(
              elevation: 3.0,
              child: Container(

                child: Column(
                  children: <Widget>[
                    Material(
                      child: Container(
                        width: 200.0,
                        height: 200.0,
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
                          message,
                          style: TextStyle(
                            fontSize: 20.0,
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
            flex: 4,
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
                    "Continue",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 25.0,
                  ),
                  borderSide: BorderSide(width: 2.0, color: Colors.indigoAccent),
                  splashColor: Colors.indigoAccent,
                )
              ],
            ),
          )
        ],
      )
    );
  }
}
