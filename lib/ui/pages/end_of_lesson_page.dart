import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_english/core/services/user_service.dart';
import 'package:learn_english/provider/account_user.dart';
import 'package:learn_english/provider/num_of_correct_answer_state.dart';
import 'package:learn_english/provider/result_learning_state.dart';
import 'package:learn_english/provider/slider_state.dart';
import 'package:learn_english/ui/modules/audio_local_player.dart';
import 'package:learn_english/ui/modules/route_name.dart';
import 'package:learn_english/ui/pages/loading_page.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class EndOfLessonPage extends StatelessWidget {
  bool loading = true;
  UserService userService = UserService();
  AccountUser accountUser = AccountUser();
  AudioLocalPlayer audioLocalPlayer = AudioLocalPlayer();
  Color _color;

  @override
  Widget build(BuildContext context) {
    SliderState sliderState = Provider.of<SliderState>(context);
    ResultLearningState resultLearningState =
        Provider.of<ResultLearningState>(context);
    NumOfCorrectAnswer numOfCorrectAnswer =
        Provider.of<NumOfCorrectAnswer>(context);

    if (loading) {
      audioLocalPlayer.playFinishLessonSound();
      resultLearningState.setPercentCorrect(
          (numOfCorrectAnswer.number / sliderState.getMaxOfSlider * 100)
              .toInt());
      if (resultLearningState.getPercentCorrect <= 40)
        _color = Colors.red;
      else if (resultLearningState.getPercentCorrect <= 60)
        _color = Colors.orange;
      else if (resultLearningState.getPercentCorrect < 100)
        _color = Colors.teal;
      else if (resultLearningState.getPercentCorrect == 100)
        _color = Colors.green;

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
                                text: '${numOfCorrectAnswer.number * 3}',
                                style: TextStyle(
                                    color: Colors.orange, fontSize: 50)),
                            TextSpan(text: ' EXP'),
                          ]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.0),
                      child: Column(
                        children: [
                          CircularPercentIndicator(
                            radius: 150.0,
                            lineWidth: 5.0,
                            percent:
                                resultLearningState.getPercentCorrect / 100,
                            center: Container(
                              height: 142,
                              width: 142,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.yellow.withOpacity(0.1),
                                image: DecorationImage(
                                    image:
                                        Image.asset('assets/carrot.gif').image,
                                    fit: BoxFit.fitHeight),
                              ),
                            ),
                            backgroundColor: Colors.grey[300],
                            progressColor: _color,
                          ),
                          Text(
                            '${resultLearningState.getPercentCorrect}%',
                            style: TextStyle(fontSize: 25, color: _color),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    FlatButton(
                      onPressed: () {
                        audioLocalPlayer.playClickSound();

                        Map<String, dynamic> map = Map();
                        if (accountUser.user.learningResult != null)
                          map = accountUser.user.learningResult;

                        if (!map.containsKey(resultLearningState.lessonId)) {
                          map[resultLearningState.lessonId] =
                              resultLearningState.getPercentCorrect;
                          userService.updateLearningResult(accountUser.user.userId, map);
                        } else {
                          if ((map[resultLearningState.lessonId]).toInt() <
                              resultLearningState.getPercentCorrect) {
                            map.update(
                                resultLearningState.lessonId,
                                (value) =>
                                    resultLearningState.getPercentCorrect);
                            userService.updateLearningResult(
                                accountUser.user.userId, map);
                          }
                        }
                        if (numOfCorrectAnswer.number > 0) {
                          int currentExp = accountUser.user.exp;
                          userService.updateExp(accountUser.user.userId,
                              currentExp + (numOfCorrectAnswer.number * 3));
                        }
                        Navigator.pushNamedAndRemoveUntil(context,
                            RouteName.home, (Route<dynamic> route) => false);
                      },
                      child: Text(
                        'Back to Home',
                        style: TextStyle(fontSize: 20, color: Colors.black.withOpacity(0.6)),
                      ),
                      color: Colors.green[300],
                    ),
                  ],
                ),
              ],
            ));
  }
}
