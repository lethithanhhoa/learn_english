import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/ui/modules/route_name.dart';
import 'package:learn_english/ui/page_models/game/taptap/state/level_state.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

class EndGamePage extends StatefulWidget {
  _EndGameState createState() => _EndGameState();
}

class _EndGameState extends State<EndGamePage> {
  Widget currentWidget;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      currentWidget = gift();
    });
  }

  Future<bool> onWillPop() {
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    LevelState levelState = Provider.of<LevelState>(context);
    Timer(Duration(milliseconds: 3210), () {
      setState(() {
        currentWidget = result(levelState);
      });
    });
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: 300,
              child: Center(child: currentWidget),
            ),
            FlatButton(
                onPressed: () {
                  // int count = 0;
                  // Navigator.popUntil(context, (route) {
                  //   return count++ == 2;
                  // });
                  Navigator.pushNamedAndRemoveUntil(context, RouteName.taptap_rank, (route) => false);
                },
                child: Text('Back')),
          ],
        ),
      ),
    );
  }

  Widget gift() {
    return Image.asset('assets/giftbox.gif');
  }

  Widget result(LevelState levelState) {
    return Text(
      'Score: ${levelState.getScore}',
      textAlign: TextAlign.center,
    );
  }
}
