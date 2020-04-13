import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/ui/provider/slider_state.dart';
import 'package:learn_english/ui/provider/state_of_continue_button.dart';
import 'package:provider/provider.dart';

class MySlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SliderState sliderState = Provider.of<SliderState>(context);
    ContinueButtonState continueButtonState = Provider.of<ContinueButtonState>(context);
    return Stack(
      children: <Widget>[
        Container(
          height: 18,
          width: 220,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white.withOpacity(0.4),
          ),
        ),
        Container(
          height: 18,
          width: 220 * continueButtonState.getCorrectAnswerNum/sliderState.getMaxOfSlider,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              // color: Colors.lime,
             // gradient: LinearGradient(
              //    colors: [Colors.lightGreen[100], Colors.lightGreen[600]])
              ),
        ),
      ],
    );
  }
}
