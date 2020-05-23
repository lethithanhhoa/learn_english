import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/ui/page_models/game/taptap/state/level_state.dart';
import 'package:provider/provider.dart';

class EndGamePage extends StatefulWidget {
  _EndGameState createState() => _EndGameState();
}

class _EndGameState extends State<EndGamePage> {
  bool _isShowing;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _isShowing = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    LevelState levelState = Provider.of<LevelState>(context);
    Timer(Duration(seconds: 2, milliseconds: 300), () {
      setState(() {
        _isShowing = false;
      });
    });
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Center(
            child: _isShowing
                ? Container(
                    height: MediaQuery.of(context).size.width,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      image: DecorationImage(
                          image: Image.asset('assets/giftbox.gif').image,
                          fit: BoxFit.cover),
                    ),
                  )
                : Container(
                    child: Text(
                      'Level: ${levelState.getCurrentLevel}',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
          ),
          FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Back')),
        ],
      )),
    );
  }
}
