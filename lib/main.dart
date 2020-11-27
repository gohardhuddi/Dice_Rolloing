import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.red[700],
          appBar: AppBar(
            shadowColor: Colors.pink,
            backgroundColor: Colors.redAccent[700],
            centerTitle: true,
            title: Text('Dice Role'),
          ),
          body: Dicepage(),
        ),
      ),
    );
  }
}

class Dicepage extends StatefulWidget {
  @override
  _DicepageState createState() => _DicepageState();
}

class _DicepageState extends State<Dicepage> {
  var leftdice = 4;
  var rightdice = 5;
  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed: () {
        // SystemChannels.navigation.;
        exit(0);
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Continue"),
      onPressed: () {
        Navigator.pop(context, true);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Game Over"),
      content: Text("Would you like to continue Playing"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void Diceface() {
    setState(() {
      leftdice = Random().nextInt(6) + 1;
      rightdice = Random().nextInt(6) + 1;
      print(rightdice);
      print(leftdice);
      if (rightdice == leftdice) {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("Game Over"),
        ));
        showAlertDialog(context);
      }
    });
  }

  //we have to decl veriale in side state<Disecpage> to work
  @override
  Widget build(BuildContext context) {
    //every thing that have something to do only works inside build method
    return Center(
      child: Row(
        children: [
          Expanded(
            child: FlatButton(
              onPressed: () {
                Diceface();
              },
              child: Image(
                image: AssetImage('images/dice$leftdice.png'),
              ),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: FlatButton(
              onPressed: () {
                Diceface();
              },
              child: Image(
                image: AssetImage('images/dice$rightdice.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
