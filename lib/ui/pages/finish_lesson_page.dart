import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/ui/modules/route_name.dart';
import 'package:learn_english/ui/provider/slider_state.dart';
import 'package:learn_english/ui/provider/state_of_continue_button.dart';
import 'package:provider/provider.dart';

class FinishLessonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ContinueButtonState continueButtonState =
        Provider.of<ContinueButtonState>(context);
    SliderState sliderState = Provider.of<SliderState>(context);
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('You are finish this lesson.'),
        Text(
            '${continueButtonState.getCorrectAnswerNum} / ${sliderState.getMaxOfSlider}'),
        FlatButton(
            onPressed: () {

              Navigator.pushNamedAndRemoveUntil(
                  context, RouteName.homePage, (Route<dynamic> route) => false);
            },
            child: Text('Done'),
            color: Colors.pink,
            ),
      ],
    ));
  }
}
