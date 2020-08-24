import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:optimal_creations/QuizScreen.dart';

class TitlePage extends StatelessWidget {
  TitlePage({
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
                // Container(
                //   decoration: BoxDecoration(
                //     image: DecorationImage(
                //       // image: const AssetImage('assets/images/dp.jpg'),
                //       // fit: BoxFit.cover,
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Center(
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0)),
                          color: Color(0xff3E67D6),
                          child: Container(
                            width: w * 0.55,
                            height: h * 0.07,
                            child: Center(
                              child: Text(
                                'START',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: f * 0.04,
                                  color: const Color(0xffffffff),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QuizScreen()),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top:54),
                //   child: Column(
                //     children: <Widget>[
                //       Center(
                //         child: Container(
                //             width: 318.0,
                //             child: Text(
                //               'Designed for you \nand your home',
                //               style: TextStyle(
                //                 fontFamily: 'Poppins',
                //                 fontSize: 30,
                //                 color: const Color(0xff000000),
                //                 fontWeight: FontWeight.w800,
                //                 height: 1.1666666666666667,
                //               ),
                //               textAlign: TextAlign.center,
                //             ),
                //           ),
                //       ),
                //     ],
                //   ),
                // ),
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
                                  'QUIZ APP',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: f * 0.16,
                                    color: const Color(0xff000000),
                                    fontWeight: FontWeight.w900,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                SizedBox(height: h * 0.01),
                                Text(
                                  'Check Your IQ',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: f * 0.05,
                                    color: const Color(0xff000000),
                                    letterSpacing: 2.9000000000000001,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
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
