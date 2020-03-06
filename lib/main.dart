import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tictactoe/tictactoe.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        color: Colors.black,
        height: height,
        width: width,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 200),
                child: Text("TIC TAC TOE",style: TextStyle(
                  color: Colors.white,
                  fontFamily: "BlackOpsOne",
                  fontSize: 40,
                  shadows: [
                    Shadow(
                     color: Colors.white,
                      blurRadius: 20,
                      offset: Offset(5,5)

                    )
                  ]
                ),),
              ),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: AvatarGlow(
                  startDelay: Duration(milliseconds: 1000),
                  glowColor: Colors.white,
                  endRadius: 110.0,
                  duration: Duration(milliseconds: 2000),
                  repeat: true,
                  showTwoGlows: true,
                  repeatPauseDuration: Duration(milliseconds: 100),
                  child: Material(
                    elevation: 8.0,
                    shape: CircleBorder(),
                    child: CircleAvatar(
                        backgroundColor:Colors.grey[100] ,
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, PageTransition(type: PageTransitionType.upToDown, child: logic()));
                          },
                          child: Container(
                            child:Text("START",style: TextStyle(
                                color: Colors.black,
                                fontFamily: "BlackOpsOne",
                                fontSize: 20,
                                shadows: [
                                  Shadow(
                                      color: Colors.white,
                                      blurRadius: 20,
                                      offset: Offset(5,5)

                                  )
                                ]
                            ),),
                          ),
                        ),
                        radius: 60.0,

                    ),
                  ),
                  shape: BoxShape.circle,
                  animate: true,
                  curve: Curves.fastOutSlowIn,
                ),
              )
            ],
          ),
        ),

      ),
    );
  }
}
