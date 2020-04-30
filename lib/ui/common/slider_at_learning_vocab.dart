import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_english/ui/state/slider_state.dart';
import 'package:learn_english/ui/state/state_of_continue_button.dart';
import 'package:provider/provider.dart';

class MySlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SliderState sliderState = Provider.of<SliderState>(context);
    ContinueButtonState continueButtonState =
        Provider.of<ContinueButtonState>(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Stack(
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
                    width: 220*
                        continueButtonState.getCorrectAnswerNum /
                        sliderState.getMaxOfSlider,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 5.0),
            child: Container(
              width: 40,
              child: Text(
                '${continueButtonState.getCorrectAnswerNum}/${sliderState.getMaxOfSlider}',
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
