import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_english/ui/modules/route_name.dart';

class StartingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5), () {
      Navigator.pushNamed(
          context, RouteName.loginPage);
    });
    return Scaffold(
      backgroundColor: Colors.green[200],
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: TyperAnimatedTextKit(
              speed: Duration(milliseconds: 200),
              text: [
                "English for Kids",
              ],
              textStyle: GoogleFonts.caveat(
                  textStyle: TextStyle(
                color: Colors.white,
                fontSize: 100,
                // fontWeight: FontWeight.bold,
              )),
              textAlign: TextAlign.start,
              alignment: AlignmentDirectional.topStart),
        ),
      ),
    );
  }
}
