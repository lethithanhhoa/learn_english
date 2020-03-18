import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:learn_english/provider/speech_provider.dart';
import 'package:learn_english/ui/common/microphone.dart';
import 'package:provider/provider.dart';

class NextQuizButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NextQuiz nextQuiz = Provider.of<NextQuiz>(context);
    // RecordVoice recordVoice = Provider.of<RecordVoice>(context);
    return Container(
      height: 150,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Container(
              height: 60,
              width: 270,
              decoration: BoxDecoration(
                color: Colors.pink[400],
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                border: Border.all(color: Colors.grey[100]),
              ),
              child: FlatButton(
                  onPressed: () {
                    nextQuiz.setIndex();
                    // recordVoice.initState();
                  },
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
