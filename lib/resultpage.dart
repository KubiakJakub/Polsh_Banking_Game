import 'package:flutter/material.dart';

class resultpage extends StatefulWidget {
  @override
  _resultpageState createState() => _resultpageState();
}

class _resultpageState extends State<resultpage> {
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
              child: Container(

                child: Column(
                  children: <Widget>[
                    Material(
                      child: Container(
                        width: 300.0,
                        height: 300.0,
                        child: ClipRect(
                          child: Image(
                            image:  AssetImage(
                              "images/image.png"
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        "Your score: "
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
                  onPressed: (){},
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
