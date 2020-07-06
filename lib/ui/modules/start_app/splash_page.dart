import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_english/core/services/auth_service.dart';
import 'package:learn_english/ui/modules/route_name.dart';
import 'package:flutter/services.dart';
import 'package:sa_anicoto/sa_anicoto.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class SplashPage extends StatefulWidget {
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with AnimationMixin {
  String verInDatabase;
  String verInGSheet;

  int timeToLoad = 3;
  bool state;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    checkUserSignedIn();
  }

  void checkUserSignedIn() async {
    bool isSingIn = await AuthService().isSignedIn();
    setState(() {
      state = isSingIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: timeToLoad), () {
      if (state)
        Navigator.popAndPushNamed(context, RouteName.home);
      else
        Navigator.pushNamedAndRemoveUntil(
            context, RouteName.login, (Route<dynamic> route) => false);
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: (kIsWeb)
            ? AutoSizeText(
                'EFK',
                maxLines: 1,
                style: GoogleFonts.audiowide(
                    fontSize: 100,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink),
              )
            : SizedBox(
                child: TextLiquidFill(
                  loadDuration: Duration(seconds: 2),
                  waveDuration: Duration(seconds: 1),
                  text: 'EFK',
                  waveColor: Colors.pink,
                  boxBackgroundColor: Colors.white,
                  textStyle: GoogleFonts.audiowide(
                    fontSize: 100,
                    fontWeight: FontWeight.bold,
                  ),
                  boxHeight: 300,
                  boxWidth: 300,
                ),
              ),
      ),
    );
  }
}
