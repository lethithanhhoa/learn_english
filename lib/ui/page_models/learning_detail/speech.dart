import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/core/models/word.dart';
import 'package:learn_english/provider/speech_provider.dart';
import 'package:learn_english/ui/common/microphone.dart';
import 'package:learn_english/ui/common/next_quiz_button.dart';
import 'package:learn_english/ui/common/speaker.dart';
import 'package:provider/provider.dart';

class Speech extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NextQuiz nextQuiz = Provider.of<NextQuiz>(context);
    Word word = nextQuiz.getCurrentWord;
    return Container(
      color: Colors.white30,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // SliderInLearningDetail(),
          topPage(context, word),
          // Microphone(),
          RecordVoiceProvider(word: word),
          NextQuizButton(),
        ],
      ),
    );
  }

  Widget topPage(BuildContext context, Word word) {
    return Container(
        height: 310,
        child: Column(
          children: <Widget>[
            Container(
              height: 260,
              width: 360,
              child: Stack(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: Image.asset('assets/board.png').image,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 75.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 240,
                              height: 170,
                              decoration: BoxDecoration(
                                // color: Colors.blue,
                                image: DecorationImage(
                                    image: Image.network('${word.imgName}').image,                                   
                                        
                                    fit: BoxFit.scaleDown),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 50,
                  child: Text(
                    word.word,
                    style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink[400]),
                  ),
                ),
                SizedBox(
                  width: 15.0,
                ),
                Speaker(
                  word: word,
                ),
              ],
            ),
          ],
        ));
  }
}
