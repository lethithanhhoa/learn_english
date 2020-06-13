import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learn_english/ui/provider/recording.dart';
import 'package:learn_english/ui/provider/state_of_continue_button.dart';
import 'package:provider/provider.dart';

class Microphone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Recording recording = Provider.of<Recording>(context);
    ContinueButtonState continueButtonState =
        Provider.of<ContinueButtonState>(context);

    return GestureDetector(
      onTap: continueButtonState.getActive
          ? () {
              recording.record();
            }
          : null,
      child: Container(
          height: 90,
          width: 90,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (!recording.getListening)
                  ? Colors.blue.withOpacity(0.1)
                  : Colors.red.withOpacity(0.1)),
          child: (!recording.getListening)
              ? Icon(
                  FontAwesomeIcons.microphone,
                  size: 60,
                  color: Colors.blue[300],
                )
              : Icon(
                  FontAwesomeIcons.stop,
                  size: 40,
                  color: Colors.red,
                )),
    );
  }
}
