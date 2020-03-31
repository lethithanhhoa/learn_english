import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learn_english/core/models/word.dart';
import 'package:learn_english/ui/common/play_sound.dart';
import 'package:learn_english/ui/common/play_sound.dart';
import 'package:learn_english/ui/provider/indexOfList.dart';
import 'package:learn_english/ui/provider/recording.dart';
import 'package:provider/provider.dart';

class ListenAndRepeat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Recording recording = Provider.of<Recording>(context);
    Index indexOfList = Provider.of<Index>(context);
    // TODO: implement build
    return Consumer<List<Word>>(builder: (context, value, child) {
      if (value == null) return Center(child: CircularProgressIndicator());
      return (indexOfList.index >= value.length)
          ? Scaffold(
              backgroundColor: Colors.yellow,
            )
          : Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(title: Text('Title')),
              body: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 2,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: Image.asset('assets/c.jpg').image,
                                    fit: BoxFit.scaleDown)),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 100, 10, 0),
                              child: Transform.rotate(
                                angle: -pi / 90,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 3 / 4,
                                  height:
                                      MediaQuery.of(context).size.height / 3.5,
                                  // color: Colors.yellow.withOpacity(0.7),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                    3.5 -
                                                50,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: Image.network(
                                                      '${value[indexOfList.index].imgName}')
                                                  .image,
                                              fit: BoxFit.scaleDown),
                                        ),
                                        child: Container(
                                          alignment: Alignment.topRight,
                                          child: Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.yellow[200],
                                            ),
                                            child: PlaySound(
                                                anyWord:
                                                    value[indexOfList.index]
                                                        .word),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 45,
                                        child: Text(
                                          value[indexOfList.index].word,
                                          style: TextStyle(fontSize: 38.0),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      // color: Colors.yellow,
                      child: FlatButton(
                        color: Colors.lightGreen[100],
                        shape: CircleBorder(),
                        onPressed: () {
                          recording.record();
                        },
                        child: Icon(
                          FontAwesomeIcons.microphone,
                          size: 70,
                          color: Colors.lightGreen,
                        ),
                      ),
                    ),
                    resultText(context, value[indexOfList.index].word,
                        recording.getTextResult),
                    
                    Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      // color: Colors.blue,
                      child: Center(
                        child: Container(
                          height: 60,
                          width: 270,
                          decoration: BoxDecoration(
                            color: Colors.lightGreen,
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0)),
                            border: Border.all(color: Colors.grey[100]),
                          ),
                          child: Builder(
                            builder: (context) => FlatButton(
                              onPressed: () {
                                Scaffold.of(context).showSnackBar(snackBar(
                                    context,
                                    value[indexOfList.index].word,
                                    recording.getTextResult));
                                Future.delayed(Duration(seconds: 3), () {
                                  indexOfList.increment();
                                  recording.fetchText();
                                });
                              },
                              child: Text(
                                'Continue',
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
            );
    });
  }

  Widget snackBar(BuildContext context, String text, String resultRecording) {
    return SnackBar(
      duration: Duration(seconds: 2),
      backgroundColor: (text.toLowerCase() == resultRecording.toLowerCase())
          ? Colors.lightGreen[100].withOpacity(0.8)
          : Colors.pink[100].withOpacity(0.8),
      content: Container(
        height: 90,
        child: Text(
          text,
          style: TextStyle(
            color: (text.toLowerCase() == resultRecording.toLowerCase())
                ? Colors.green
                : Colors.pink,
            fontSize: 23.0,
          ),
        ),
      ),
    );
  }

  Widget resultText(BuildContext context, String text, String resultRecording) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: 25.0,
      child: Text(
        resultRecording,
        style: TextStyle(
            color: (text.toLowerCase() == resultRecording.toLowerCase())
                ? Colors.green
                : Colors.pink,
            fontSize: 23.0,
            decoration: (text.toLowerCase() == resultRecording.toLowerCase())
                ? TextDecoration.none
                : TextDecoration.lineThrough),
      ),
    );
  }
}
