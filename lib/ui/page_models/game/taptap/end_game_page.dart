import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_english/core/services/user_service.dart';
import 'package:learn_english/ui/modules/route_name.dart';
import 'package:learn_english/ui/page_models/game/taptap/state/level_state.dart';
import 'package:learn_english/ui/state/account_user.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

class EndGamePage extends StatefulWidget {
  _EndGameState createState() => _EndGameState();
}

class _EndGameState extends State<EndGamePage> {
  UserService userService = new UserService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<bool> onWillPop() {
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    LevelState levelState = Provider.of<LevelState>(context);
    AccountUser accountUser = Provider.of<AccountUser>(context);

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                child: ColorizeAnimatedTextKit(
                    text: ["Game Over"],
                    textStyle: GoogleFonts.rockSalt(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                    colors: [
                      Colors.purple,
                      Colors.blue,
                      Colors.yellow,
                      Colors.red,
                    ],
                    textAlign: TextAlign.center,
                    alignment: AlignmentDirectional.topStart),
              ),
              SizedBox(
                height: 40,
              ),
              FlatButton(
                  onPressed: () {
                    if (accountUser.user.taptap < levelState.getScore) {
                      userService.updateTapTap(
                          accountUser.user.userId, levelState.getScore);
                    }

                    Navigator.pushNamedAndRemoveUntil(
                        context, RouteName.taptap_rank, (route) => false);
                  },
                  color: Colors.purple[300],
                  child: Text('Next', style: TextStyle(color: Colors.white, fontSize: 20),)),
            ],
          ),
        ),
      ),
    );
  }
}
