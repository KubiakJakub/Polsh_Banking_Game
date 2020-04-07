import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizapp/quizpage.dart';

class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  List<String> images = [
    "images/image.png",
    "images/image.png",
    "images/image.png",
    "images/image.png",
    "images/image.png"
  ];

  Widget customcard(String category, String image){
    return Padding(
      padding: EdgeInsets.all( 20.0),
      child: InkWell(
        onTap: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => getjason(),
          ));
        },
        child: Material(
          color: Colors.blueAccent,
          elevation:  10.0,
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child:  Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(100.0),
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
                Center(
                  child: Text(
                    category,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontFamily: "Lato-Regular"
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "This is a example description",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: "Lato-Italic",
                      color: Colors.white,
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

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown, DeviceOrientation.portraitUp
    ]);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quiz app",
          style: TextStyle(
            fontFamily: "Lato-Bold",
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          customcard("Category 1", images[0]),
          customcard("Category 2", images[1]),
          customcard("Category 3", images[2]),
          customcard("Category 4", images[3]),
          customcard("Category 5", images[4]),
        ],
      ),
    );
  }
}
