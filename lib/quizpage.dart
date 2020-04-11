import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizapp/resultpage.dart';

class getjason extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString("assets/questions.json"),
      builder: (context, snapshot){
        var mydata = json.decode(snapshot.data.toString());
        if(mydata == null){
          return Scaffold(
            body: Center(
              child: Text(
                "Loading",
              ),
            ),
          );
        }else{
          return quizpage(mydata : mydata);
        }
      },
    );
  }
}


class quizpage extends StatefulWidget {

  var mydata;
  quizpage({Key key, @required this.mydata}) : super(key : key);


  @override
  _quizpageState createState() => _quizpageState(mydata);
}

class _quizpageState extends State<quizpage> {

  var mydata;
  _quizpageState(this.mydata);

  Color showColor = Colors.indigoAccent;
  Color right = Colors.greenAccent;
  Color wrong = Colors.redAccent;
  int marks = 0;
  int i = 1;
  int timer = 30;
  String showTimer = "30";

  Map<String, Color> btn_color = {
    "a": Colors.indigoAccent,
    "b": Colors.indigoAccent,
    "c": Colors.indigoAccent,
    "d": Colors.indigoAccent
  };

  bool cancel_timer = false;

  @override
  void initState(){
    startTimer();
    super.initState();
  }

  void startTimer() async{
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t){
      setState(() {
        if(timer < 1){
          t.cancel();
        }else if(cancel_timer == true){
          t.cancel();
        }else{
          timer = timer - 1;
        }
        showTimer = timer.toString();
      });
    });
  }

  void nextQuestion(){
    cancel_timer = false;
    timer = 30;
    setState(() {
      if(i < 5){
        i++;
      }else{
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => resultpage(),
        ));
      }
      btn_color['a'] = Colors.indigoAccent;
      btn_color['b'] = Colors.indigoAccent;
      btn_color['c'] = Colors.indigoAccent;
      btn_color['d'] = Colors.indigoAccent;
    });
    startTimer();
  }



  void checkanswer(String key){
    if(mydata[2]["1"] == mydata[1]["1"][key]){
      marks = marks + 5;
      showColor = right;
    }else{
      showColor = wrong;
    }
    setState(() {
      btn_color[key] = showColor;
      cancel_timer = true;
    });
    Timer(Duration(seconds: 2), nextQuestion);
  }


  Widget choicebutton(String key){
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: MaterialButton(
        onPressed: () => checkanswer(key),
        child: Text(
          mydata[1][i.toString()][key],
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Lato-Regular",
            fontSize: 14.0,
          ),
          maxLines: 1,
        ),
        color: btn_color[key],
        minWidth: 200.0,
        height: 40.0,
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        return showDialog(context: context, builder: (context) => AlertDialog(
          title: Text(
            "Quiz app",
          ),
          content: Text(
            "You cen't go back"
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: Text(
                "ok"
              ),
            )
          ],
        ),);
      },
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child:  Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  mydata[0][i.toString()],
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    choicebutton('a'),
                    choicebutton('b'),
                    choicebutton('c'),
                    choicebutton('d')
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child:  Container(
                alignment: Alignment.topCenter,
                child: Center(
                  child: Text(
                    showTimer,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Times New Roman',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
