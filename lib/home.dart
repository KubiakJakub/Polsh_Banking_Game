import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizapp/quizpage.dart';

class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
// =============== U S E R   D E F I N E D   V E R I A B L E S ===============
  List<String> images = [
    "images/true_false_image.jpg",
    "images/image.png",
    "images/image.png",
    "images/image.png",
    "images/image.png"
  ];

// =============== W I D G E  T S ===============
  Widget customcard(String category, String image){
    return Padding(
      padding: EdgeInsets.all( 20.0),
      child: InkWell(
        onTap: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => getjason(),
          ));
        },
        // KATEGORIA
        child: Material(
          color: Colors.white,
          elevation:  0.0,
          borderRadius: BorderRadius.circular(30.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child:  Material(
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(30.0),
                    child:  Container(
                      height: 200.0,
                      width: 200.0,
                      child: ClipOval(
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            image,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // NAZWA KATEGORII
                Center(
                  child: Text(
                    category,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black87,
                      fontFamily: "Lato-Regular"
                    ),
                  ),
                ),
                // OPIS
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "Zadania w których występpują tylko dwie odpowiedzi na pytanie,"
                        " prawa lub fałsz.",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: "Lato-Italic",
                      color: Colors.black45,
                    ),
                    maxLines: 5,
                    textAlign: TextAlign.justify,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


  // Zablokowanie orientacji w pionie
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown, DeviceOrientation.portraitUp
    ]);

    return Scaffold(
      backgroundColor: Color(0xff36BF7F),
      appBar: AppBar(
        backgroundColor: Color(0xff36BF7F),
        elevation: 0.0,
        title: Text(
          "Quiz NBP",
          style: TextStyle(
            fontFamily: "Lato-Bold",
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          // nazwa kategorii, grafika
          customcard("Prawda / Fałsz", images[0]),
          customcard("Category 2", images[1]),
          customcard("Category 3", images[2]),
          customcard("Category 4", images[3]),
          customcard("Category 5", images[4]),
        ],
      ),
    );
  }
}
