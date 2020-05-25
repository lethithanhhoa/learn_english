import 'dart:async';
import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:learn_english/ui/common/app_bar.dart';
import 'package:learn_english/ui/common/continue_button.dart';
import 'package:learn_english/ui/common/microphone.dart';
import 'package:learn_english/ui/common/speaker.dart';
import 'package:learn_english/ui/modules/audio_player.dart';
import 'package:learn_english/ui/state/recording.dart';

import 'package:provider/provider.dart';

class ListenAndRepeat extends StatefulWidget {
  Vocabulary vocabulary;
  ListenAndRepeat({this.vocabulary});
  _ListenAndRepeatState createState() => _ListenAndRepeatState();
}

class _ListenAndRepeatState extends State<ListenAndRepeat> {
  AudioPlayer playAudio = AudioPlayer();
  String recordingText;
  @override
  void initState() {
    super.initState();
    playAudio.playCustomAudioFile(widget.vocabulary.audioFile);
  }

  Future<bool> onWillPop() {
    Fluttertoast.showToast(msg: "Press close icon to back");
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    Recording recording = Provider.of<Recording>(context);
    if (recording.getBestResult.toLowerCase() ==
        widget.vocabulary.vocab.toLowerCase())
      setState(() {
        recordingText = recording.getBestResult;
      });
    else {
      int i = 0;
      recording.getListResult.forEach((element) {
        // print(element.recognizedWords);
        if (element.recognizedWords.toLowerCase() ==
            widget.vocabulary.vocab.toLowerCase()) {
          setState(() {
            recordingText = element.recognizedWords;
          });
          return;
        } else
          i++;
      });
      if (i == recording.getListResult.length)
        recordingText = recording.getBestResult;
    }

    recording.setFinalResult(recordingText);
    // print(recording.getFinalResult);

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appBar,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: constraints.copyWith(
                  minHeight: constraints.maxHeight,
                  maxHeight: double.infinity,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(height: 10),
                                Text(
                                  'Listen and repeat',
                                  softWrap: true,
                                  maxLines: 2,
                                  overflow: TextOverflow.fade,
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 280,
                                  child: Stack(
                                    children: <Widget>[
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 280,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: Image.asset(
                                                        'assets/board3.jpg')
                                                    .image,
                                                fit: BoxFit.scaleDown)),
                                      ),
                                      Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 280,
                                          alignment: Alignment.bottomCenter,
                                          child: Container(
                                            height: 145,
                                            margin: EdgeInsets.all(5.0),
                                            // color: Colors.blue.withOpacity(0.5),
                                            child: Stack(
                                              children: [
                                                Column(
                                                  children: [
                                                    Expanded(
                                                      child: FadeInImage
                                                          .assetNetwork(
                                                        placeholder:
                                                            'assets/waiting_image.gif',
                                                        image: widget
                                                            .vocabulary.image,
                                                        fit: BoxFit.scaleDown,
                                                        fadeInCurve:
                                                            Curves.bounceIn,
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 45,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          AutoSizeText(
                                                            '${widget.vocabulary.vocab}',
                                                            style: TextStyle(
                                                              color: Colors
                                                                  .lightGreen[600],
                                                              fontSize: 50,
                                                            ),
                                                          ),
                                                          SizedBox(width: 20),
                                                          GestureDetector(
                                                            onTap: () {
                                                              playAudio.playCustomAudioFile(
                                                                  widget
                                                                      .vocabulary
                                                                      .audioFile);
                                                            },
                                                            child: Speaker(size: 50),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Microphone(),
                                _textResult(
                                    recordingText, widget.vocabulary.vocab),
                              ],
                            ),
                          ],
                        ),
                      ),
                      ContinueButton(),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _textResult(String textResult, String text) {
    return Container(
        height: 25,
        alignment: Alignment.bottomCenter,
        child: Text(
          textResult,
          maxLines: 1,
          overflow: TextOverflow.visible,
          style: TextStyle(
            color: (textResult.toLowerCase() == text.toLowerCase())
                ? Colors.lightGreen
                : Colors.pink,
            fontSize: 20,
            decoration: (textResult.toLowerCase() == text.toLowerCase())
                ? TextDecoration.none
                : TextDecoration.lineThrough,
          ),
        ));
  }
}
