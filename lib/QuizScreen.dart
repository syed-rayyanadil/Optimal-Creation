import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:optimal_creations/Questions.dart';
import 'dart:async';
import 'package:optimal_creations/EndPage.dart';

class QuizScreen extends StatefulWidget {
  QuizScreen({Key key}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  var count = 0;
  var score = 0;
  int timer = 5;
  String showtimer = "5";

  List quesList = [
    Questions("1. Allama Iqbal Designed Pakistani Flag", false,
        "assets/images/flag.jpg"),
    Questions("2. K2 is in Pakistan", true, "assets/images/k2.jpg"),
    Questions("3. 1st Computer Created By Bill Gates", false,
        "assets/images/computer.jpg"),
    Questions("4. Holy Kaaba is in Makkah", true, "assets/images/kaaba.jpg"),
    Questions(
        "5. Huawei is Japnese Comapny", false, "assets/images/huawei.jpg"),
    Questions("6. This is Lahore", true, "assets/images/lahore.jpg"),
    Questions("7. Shahjahan was burried in Bangladesh", false,
        "assets/images/shahjahan.png"),
  ];

  check(bool choice, BuildContext contextt) {
    if (choice == quesList[count].isright) {
      score = score + 1;
      // q=q+1;
      print("Right");
      final snackBar = SnackBar(
        content: Text("Correct Answer...!!!"),
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.green,
      );
      Scaffold.of(contextt).showSnackBar(snackBar);
    } else {
      score = score + 0;
      // q=q+1;
      print("Wrong");
      final snackBar = SnackBar(
        content: Text(" Wrong Answer...!!!"),
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.red,
      );
      Scaffold.of(contextt).showSnackBar(snackBar);
    }
    setState(() {
      if (count < 6) {
          // canceltimer = true;
        count = count + 1;
            timer = 6;

      }else{
        Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EndPage()),
                            );

      }
    });
  }
  bool canceltimer = false;

  @override
  void initState(){
    starttimer();
    super.initState();
  }

   void starttimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        if (timer < 1) {
          t.cancel();
          next();
        } else if (canceltimer == true) {
          t.cancel();
        } else {
          timer = timer - 1;
        }
        showtimer = timer.toString();
      });
    });
  }

  next(){
    canceltimer = false;
    timer = 5;
    setState(() {
      if (count < 6) {
        count = count + 1;
      }
    });
    starttimer();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    var f = MediaQuery.of(context).size.width;
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Builder(
          builder: (contextt) => Container(
            color: Colors.indigo[100],
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 50,
                ),
                child: Column(mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        child: Text(
                          "CORRECT ANSWERS: $score/7",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            // fontSize: 24,
                            fontSize: f * 0.066,
                            color: Colors.blue[800],
                            fontWeight: FontWeight.w200,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(height:15),
                      Container(
                        child: Text(showtimer,
                            // quesList[count].ques,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              // fontSize: 24,
                              fontSize: f * 0.066,
                              color: const Color(0xff000000),
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Container(
                        child: Center(
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.80,
                        height: MediaQuery.of(context).size.height * 0.27,
                        // child: Text("Image"),
                        child: Image.asset(
                          quesList[count].imagees,
                          fit: BoxFit.fill,
                        ),
                        // child: Image(
                        //   fit: BoxFit.contain,
                        //   image: AssetImage(
                        //     imagees[0],
                        //   ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.06,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Text(
                            quesList[count].ques,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              // fontSize: 24,
                              fontSize: f * 0.066,
                              color: const Color(0xff000000),
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.09,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0.0, right: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Center(
                              child: FlatButton(
                                onPressed: () => check(true, contextt),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(80.0)),
                                padding: EdgeInsets.all(0.0),
                                child: Ink(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.green,
                                      style: BorderStyle.solid,
                                      width: 1.0,
                                    ),
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: Container(
                                    constraints: BoxConstraints(
                                        maxWidth:
                                            MediaQuery.of(context).size.width *
                                                0.40,
                                        minHeight:
                                            MediaQuery.of(context).size.height *
                                                0.06),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "True",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.w700,
                                        fontSize: MediaQuery.of(context)
                                                .textScaleFactor *
                                            20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: FlatButton(
                                onPressed: () => check(false, contextt),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(80.0)),
                                padding: EdgeInsets.all(0.0),
                                child: Ink(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.red,
                                      style: BorderStyle.solid,
                                      width: 1.0,
                                    ),
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: Container(
                                    constraints: BoxConstraints(
                                        maxWidth:
                                            MediaQuery.of(context).size.width *
                                                0.40,
                                        minHeight:
                                            MediaQuery.of(context).size.height *
                                                0.06),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "False",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.w700,
                                        fontSize: MediaQuery.of(context)
                                                .textScaleFactor *
                                            20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
