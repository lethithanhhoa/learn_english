import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_english/ui/state/num_of_correct_answer_state.dart';
import 'package:learn_english/ui/state/slider_state.dart';
import 'package:learn_english/ui/state/state_of_continue_button.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

class MySlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SliderState sliderState = Provider.of<SliderState>(context);
    NumOfCorrectAnswer numOfCorrectAnswer = Provider.of<NumOfCorrectAnswer>(context);
    return Expanded(
      child: Row(
        children: <Widget>[
          Expanded(
            child: LinearPercentIndicator(
              // width: MediaQuery.of(context).size.width,
              lineHeight: 18.0,
              percent: numOfCorrectAnswer.number /
                  sliderState.getMaxOfSlider,
              backgroundColor: Colors.white.withOpacity(0.3),
              progressColor: Colors.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 5.0),
            child: Container(
              width: 40,
              child: Text(
                '${numOfCorrectAnswer.number}/${sliderState.getMaxOfSlider}',
                style: GoogleFonts.handlee(
                  textStyle: TextStyle(fontSize: 15, color: Colors.white70),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
