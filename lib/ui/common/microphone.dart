import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learn_english/ui/state/recording.dart';
import 'package:learn_english/ui/state/state_of_continue_button.dart';
import 'package:provider/provider.dart';

class Microphone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Recording recording = Provider.of<Recording>(context);
    ContinueButtonState continueButtonState =
        Provider.of<ContinueButtonState>(context);
    // return Ink(
    //   height: 100,
    //   width: 100,
    //   decoration: BoxDecoration(
    //     color: Colors.lightGreen[100],
    //     shape: BoxShape.circle,
    //   ),
    //   child: FlatButton(
    //     onPressed:
    //       continueButtonState.getActive?
    //         () {
    //             recording.record();
    //           }
    //           : null
    //         ,
    //     child: Icon(
    //       FontAwesomeIcons.microphone,
    //       color: Colors.lightGreen,
    //       size: 70,
    //     ),
    //   ),
    // );
    return GestureDetector(
      onTap: continueButtonState.getActive
          ? () {
              recording.record();
            }
          : null,
      child: Container(
        height: 120,
        width: 120,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: Image.asset('assets/microphone.png').image,
                fit: BoxFit.fill)),
      ),
    );
  }
}
