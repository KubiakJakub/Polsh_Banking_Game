import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizapp/resultpage.dart';

class getjason extends StatelessWidget {

  String category_name;
  getjason(this.category_name);
  String asset_to_load;

  setasset() {
    if (category_name == "Prawda / Fałsz"){
      asset_to_load = "assets/true_false_questions.json";
    } else if (category_name == 'Wielokrotnego wyboru'){
      asset_to_load = 'assets/abc_questions.json';
    }
  }


  @override
  Widget build(BuildContext context) {

    setasset();

    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString(asset_to_load, cache: true),
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
// =============== U S E R   D E F I N E D   V E R I A B L E S ===============
  var mydata;
  _quizpageState(this.mydata);

  Color showColor = Colors.indigoAccent;
  Color right = Colors.greenAccent;
  Color wrong = Colors.redAccent;
  int points = 0;
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

// =============== C U S T O M    F U N C T I O N S ===============
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
          nextQuestion();
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
      if(i < 20){
        i++;
      }else{
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => resultpage(points: points),
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
    if(mydata[2][i.toString()] == mydata[1][i.toString()][key]){
      points = points + 1;
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


// =============== W I D G E  T S ===============
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
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Lato-Regular",
            fontSize: 14.0,
          ),
          maxLines: 5,
        ),
        color: btn_color[key],
        minWidth: 300.0,
        height: 70.0,
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        return showDialog(context: context, builder: (context) => AlertDialog(
          title: Text(
            "Quiz NBP",
          ),
          content: Text(
            "Nie możesz się teraz cofnąć"
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
                   // choicebutton('d')
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
