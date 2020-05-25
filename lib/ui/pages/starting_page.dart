import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_english/ui/modules/route_name.dart';
import 'package:flutter/services.dart';
import 'package:learn_english/core/services/lesson_service.dart';
import 'package:learn_english/core/services/vocab_service.dart';
import 'package:learn_english/core/helper/gsheet_data.dart';

class StartingPage extends StatefulWidget {
  _StartingPageState createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {
  LessonService _lessonService = LessonService();
  VocabService _vocabService = VocabService();
  GSheetData _gSheetData = GSheetData();
  

  @override
  void initState() {
    super.initState();

    // lock screen
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    //load data from gsheet
    loadData();
  }

//   @override
// dispose(){
//   SystemChrome.setPreferredOrientations([
//     DeviceOrientation.landscapeRight,
//     DeviceOrientation.landscapeLeft,
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]);
//   super.dispose();
// }

  loadData() {
    _lessonService.clearAllLesson();
    _vocabService.clearAllVocab();

    _gSheetData.getLessonFromGSheet().then((value) {
      _lessonService.insertListLesson(value);
    });
    _gSheetData.getVocabFromGSheet().then((value) {
      _vocabService.insertListVocab(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5), () {
      Navigator.pushNamedAndRemoveUntil(
          context, RouteName.login, (Route<dynamic> route) => false);
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            child: Center(
              child: Container(
                height: MediaQuery.of(context).size.width - 20,
                width: MediaQuery.of(context).size.width - 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          // height: 100,
                          // width: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: Image.asset('assets/letter_e.jpg')
                                      .image)),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          // height: 100,
                          // width: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: Image.asset('assets/letter_f.jpg')
                                      .image)),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          // height: 100,
                          // width: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: Image.asset('assets/letter_k.jpg')
                                      .image)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Container(
              height: MediaQuery.of(context).size.width - 20,
              width: MediaQuery.of(context).size.width - 20,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.pink[200], width: 1.5),
                  // color: Colors.white,
                  image: DecorationImage(
                      image: Image.asset('assets/leaf_fall.gif').image,
                      fit: BoxFit.fitHeight)),
            ),
          ),
        ],
      ),
    );

    // Timer(Duration(seconds: 5), () {
    //   Navigator.pushNamed(
    //       context, RouteName.loginPage);
    // });
    // return Scaffold(
    //   backgroundColor: Colors.green[200],
    //   body: Padding(
    //     padding: EdgeInsets.symmetric(horizontal: 20.0),
    //     child: Center(
    //       child: TyperAnimatedTextKit(
    //           speed: Duration(milliseconds: 200),
    //           text: [
    //             "English for Kids",
    //           ],
    //           textStyle: GoogleFonts.caveat(
    //               textStyle: TextStyle(
    //             color: Colors.white,
    //             fontSize: 100,
    //             // fontWeight: FontWeight.bold,
    //           )),
    //           textAlign: TextAlign.start,
    //           alignment: AlignmentDirectional.topStart),
    //     ),
    //   ),
    // );
  }
}
