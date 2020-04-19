import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/core/services/user_service.dart';
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
  @override
  Widget build(BuildContext context) {
    ContinueButtonState continueButtonState =
        Provider.of<ContinueButtonState>(context);
    SliderState sliderState = Provider.of<SliderState>(context);
    ResultLearningState resultLearningState =
        Provider.of<ResultLearningState>(context);
    

    if (loading) {
      resultLearningState.setPercentCorrect(
          (continueButtonState.getCorrectAnswerNum /
                  sliderState.getMaxOfSlider *
                  100).toInt())
              ;

      loading = false;
    }
    return loading
        ? LoadingPage()
        : Scaffold(
            body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('You have finished the lesson.'),
                 Text(
                     '${continueButtonState.getCorrectAnswerNum} / ${sliderState.getMaxOfSlider}'),
                  FlatButton(
                    onPressed: () {
                      Map<String, dynamic> map = Map();
                      if (accountUser.user.learningState != null)
                        map = accountUser.user.learningState;

                      if (!map.containsKey(resultLearningState.lessonId)) {
                        map[resultLearningState.lessonId] =
                            resultLearningState.getPercentCorrect;
                        userService.updateState(accountUser.user.userId, map);
                      } 
                      else {
                        if ((map[resultLearningState.lessonId]).toInt() <
                            resultLearningState.getPercentCorrect) {
                          map.update(resultLearningState.lessonId,
                              (value) => resultLearningState.getPercentCorrect);
                          userService.updateState(
                              accountUser.user.userId, map);
                        }
                      }
                      Navigator.pushNamedAndRemoveUntil(context,
                          RouteName.homePage, (Route<dynamic> route) => false);
                    },
                    child: Text('Done'),
                    color: Colors.pink,
                  ),
                  Text('abc and ...${resultLearningState.lessonId}'),
                  Text('xxx and ...${resultLearningState.getPercentCorrect}'),
                ],
              ),
            ],
          ));
  }
}
