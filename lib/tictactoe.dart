import 'dart:io';

import 'package:flutter/material.dart';




class logic extends StatefulWidget {

  @override
  _logicState createState() => _logicState();
}

class _logicState extends State<logic> {

  List<String> marker =["","","","","","","","",""];
  int switcher=0;
  int tappedboxes=0;
  int  mood=0;
  List<int> tappedonce=[0,0,0,0,0,0,0,0,0];
  int xscore=0;
  int oscore=0;
  void _checkWinner() {

    if (marker[0] == marker[1] &&
        marker[0] == marker[2] &&
        marker[0] != '') {
      mood=1;
      _showWinDialog(marker[0]);
    }

    if (marker[3] == marker[4] &&
        marker[3] == marker[5] &&
        marker[3] != '') {
      mood=1;
      _showWinDialog(marker[3]);
    }
    if (marker[6] == marker[7] &&
        marker[6] == marker[8] &&
        marker[6] != '') {
      mood=1;
      _showWinDialog(marker[6]);
    }

    if (marker[0] == marker[3] &&
        marker[0] == marker[6] &&
        marker[0] != '') {
      mood=1;
      _showWinDialog(marker[0]);
    }

    if (marker[1] == marker[4] &&
        marker[1] == marker[7] &&
        marker[1] != '') {
      mood=1;
      _showWinDialog(marker[1]);
    }

    if (marker[2] == marker[5] &&
        marker[2] == marker[8] &&
        marker[2] != '') {
      mood=1;
      _showWinDialog(marker[2]);
    }

    if (marker[6] == marker[4] &&
        marker[6] == marker[2] &&
        marker[6] != '') {
      mood=1;
      _showWinDialog(marker[6]);
    }

    if (marker[0] == marker[4] &&
        marker[0] == marker[8] &&
        marker[0] != '') {
      mood=1;
      _showWinDialog(marker[0]);
    }
    else if(tappedboxes == 9 && mood==0){
      _showDrawDialog();

    }




  }

  void _showDrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('DRAW'),
            actions: <Widget>[
              FlatButton(
                child: Text('Play Again!'),
                onPressed: (){
                  setState(() {
                    tappedboxes=0;
                    mood=0;
                    tappedonce=[0,0,0,0,0,0,0,0,0];
                    switcher=0;
                  });
                  setState(() {
                    marker =["","","","","","","","",""];
                  });


                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });

  }

  void _showWinDialog(String winner) {
    if(winner=="X"){

      setState(() {
        xscore++;
      });

    }
    else{
      setState(() {
        oscore++;
      });
    }
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('WINNER IS: ' + winner),
            actions: <Widget>[

              FlatButton(
                child: Text('Next Round!'),
                onPressed: (){
                  setState(() {
                    tappedboxes=0;
                    mood=0;
                    tappedonce=[0,0,0,0,0,0,0,0,0];
                    switcher=0;
                  });
                  setState(() {
                    marker =["","","","","","","","",""];
                  });

                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.grey,
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            Expanded(
              flex: 3,
              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),

                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if(tappedonce[index]==0){
                            tappedboxes++;
                          }

                          if(switcher==0&& tappedonce[index]==0){
                            marker[index]="X";
                            switcher=1;
                            tappedonce[index]=1;

                          }
                          if(switcher==1&& tappedonce[index]==0){
                            marker[index]="0";
                            switcher=0;
                            tappedonce[index]=1;

                          }
                          _checkWinner();

                        });

                      },
                      child: Container(
                        decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey[700])),
                        child: Center(
                          child: Text(
                            marker[index],
                            style: TextStyle(color: Colors.black, fontSize: 40,fontFamily: "BlackOpsOne"),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: <Widget>[
                  Text("X Score="+xscore.toString(),style: TextStyle(color: Colors.black, fontSize: 25,fontFamily: "BlackOpsOne"),),
                  Text("0 Score="+oscore.toString(),style: TextStyle(color: Colors.black, fontSize: 24,fontFamily: "BlackOpsOne")),
                  SizedBox(
                    height: 15,
                  ),
                  IconButton(icon: Icon(Icons.replay), onPressed: (){
                    setState(() {
                      xscore=0;
                      oscore=0;
                    });
                  })
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
