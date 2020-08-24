import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:optimal_creations/QuizScreen.dart';

class EndPage extends StatelessWidget {
  EndPage({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    var f = MediaQuery.of(context).size.width;
    SystemChrome.setEnabledSystemUIOverlays([]);
    // debugShowCheckedModeBanner: false;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor:Colors.indigo[100],

        body: SafeArea(
          child: Center(
            child: Stack(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.80,
                                  height:
                                      MediaQuery.of(context).size.height * 0.27,
                                  child: Center(
                                      child:
                                          Image.asset("assets/images/logo.png"),
                                      
                                  ),
                                ),
                                Text(
                                  'Thank You',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: f * 0.16,
                                    color: const Color(0xff000000),
                                    fontWeight: FontWeight.w900,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
