import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_english/ui/modules/route_name.dart';
import 'package:flutter/services.dart';
import 'package:learn_english/core/services/lesson_service.dart';
import 'package:learn_english/core/services/vocab_service.dart';
import 'package:learn_english/core/helper/gsheet_data.dart';
import 'package:sa_anicoto/sa_anicoto.dart';
import 'package:supercharged/supercharged.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class SplashPage extends StatefulWidget {
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with AnimationMixin {
  LessonService _lessonService = LessonService();
  VocabService _vocabService = VocabService();
  GSheetData _gSheetData = GSheetData();
  int timeToLoad = (kIsWeb) ? 1 : 8;

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
    Timer(Duration(seconds: timeToLoad), () {
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
                  fontSize:
                      100,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink
                ),
              )
            : SizedBox(
                child: TextLiquidFill(
                  text: 'EFK',
                  waveColor: Colors.pink,
                  boxBackgroundColor: Colors.white,
                  textStyle: GoogleFonts.audiowide(
                    fontSize:
                        100,
                        // MediaQuery.of(context).size.width / 3,
                    fontWeight: FontWeight.bold,
                  ),
                  boxHeight: 300,
                  boxWidth: 300,
                  // boxHeight: MediaQuery.of(context).size.height,
                  // boxWidth: MediaQuery.of(context).size.width,
                ),
              ),
      ),
    );
  }
}
