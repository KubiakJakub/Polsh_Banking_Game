import 'dart:convert';

import 'package:flutter/material.dart';

class getjason extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString("key"),
      builder: (context, snapshot){
        var mydata = jsonDecode(snapshot.data.toString());
        if(mydata != null){
          return Scaffold(
            body: Center(
              child: Text(
                "Loading",
              ),
            ),
          );
        }else{
          return quizpage();
        }
      },
    );
  }
}


class quizpage extends StatefulWidget {
  @override
  _quizpageState createState() => _quizpageState();
}

class _quizpageState extends State<quizpage> {

  Widget choicebutton(){
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: MaterialButton(
        onPressed: (){},
        child: Text(
          "Option 1",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Lato-Regular",
            fontSize: 16.0,
          ),
        ),
        color: Colors.indigoAccent,
        minWidth: 200.0,
        height: 40.0,
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child:  Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                "Sample questioooooon :)",
                style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: "Lato-Regular",
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child:  Container(
              child: Column(
                children: <Widget>[
                  choicebutton(),
                  choicebutton(),
                  choicebutton(),
                  choicebutton()
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child:  Container(
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
