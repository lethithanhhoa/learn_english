import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_english/core/services/user_service.dart';
import 'package:learn_english/ui/modules/audio_player.dart';
import 'package:learn_english/ui/modules/route_name.dart';
import 'package:learn_english/ui/pages/loading_page.dart';

import 'package:learn_english/ui/state/account_user.dart';
import 'package:learn_english/ui/state/result_learning_state.dart';
import 'package:learn_english/ui/state/slider_state.dart';
import 'package:learn_english/ui/state/state_of_continue_button.dart';

import 'package:provider/provider.dart';

class FinishLessonPage extends StatelessWidget {
  bool loading = true;
  UserService userService = UserService();
  AccountUser accountUser = AccountUser();
  AudioPlayer audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    ContinueButtonState continueButtonState =
        Provider.of<ContinueButtonState>(context);
    SliderState sliderState = Provider.of<SliderState>(context);
    ResultLearningState resultLearningState =
        Provider.of<ResultLearningState>(context);

    if (loading) {
      audioPlayer.playFinishLessonSound();
      resultLearningState.setPercentCorrect(
          (continueButtonState.getCorrectAnswerNum /
                  sliderState.getMaxOfSlider *
                  100)
              .toInt());

      loading = false;
    }
    return loading
        ? LoadingPage()
        : Scaffold(
            backgroundColor: Colors.lightGreen[50],
            body: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'You have finished the lesson.',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                          style: GoogleFonts.handlee(
                              textStyle:
                                  TextStyle(color: Colors.green, fontSize: 40)),
                          children: <TextSpan>[
                            TextSpan(text: '+ '),
                            TextSpan(
                                text:
                                    '${continueButtonState.getCorrectAnswerNum * 3}',
                                style: TextStyle(
                                    color: Colors.orange, fontSize: 50)),
                            TextSpan(text: ' EXP'),
                          ]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 30.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.width / 2,
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          image: DecorationImage(
                              image: Image.asset('assets/carrot.gif').image,
                              fit: BoxFit.fitHeight),
                        ),
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        audioPlayer.playClickSound();
                        
                        Map<String, dynamic> map = Map();
                        if (accountUser.user.learningState != null)
                          map = accountUser.user.learningState;

                        if (!map.containsKey(resultLearningState.lessonId)) {
                          map[resultLearningState.lessonId] =
                              resultLearningState.getPercentCorrect;
                          userService.updateState(accountUser.user.userId, map);
                        } else {
                          if ((map[resultLearningState.lessonId]).toInt() <
                              resultLearningState.getPercentCorrect) {
                            map.update(
                                resultLearningState.lessonId,
                                (value) =>
                                    resultLearningState.getPercentCorrect);
                            userService.updateState(
                                accountUser.user.userId, map);
                          }
                        }
                        if (continueButtonState.getCorrectAnswerNum > 0) {
                          int currentExp = accountUser.user.exp;
                          userService.updateExp(
                              accountUser.user.userId,
                              currentExp +
                                  (continueButtonState.getCorrectAnswerNum *
                                      3));
                        }
                        Navigator.pushNamedAndRemoveUntil(
                            context,
                            RouteName.homePage,
                            (Route<dynamic> route) => false);
                      },
                      child: Text('Next', style: TextStyle(fontSize: 20),),
                      color: Colors.green,
                    ),
                  ],
                ),
              ],
            ));
  }
}
