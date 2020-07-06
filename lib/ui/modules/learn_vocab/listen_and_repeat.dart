import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:learn_english/ui/common/app_bar.dart';
import 'package:learn_english/ui/common/continue_button.dart';
import 'package:learn_english/ui/common/microphone.dart';
import 'package:learn_english/ui/common/speaker.dart';
import 'package:learn_english/ui/modules/audio/audio_player.dart';
import 'package:learn_english/ui/provider/recording.dart';
import 'package:provider/provider.dart';

import '../../general_parameter.dart';

class PageToListenAndRepeat extends StatelessWidget {
  Vocabulary vocabulary;
  PageToListenAndRepeat({this.vocabulary});
  AudioCustomPlayer playAudio = AudioCustomPlayer();
  bool loading = true;

  Future<bool> onWillPop() {
    Fluttertoast.showToast(msg: "Press close icon to back");
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    RecordingVoice recording = Provider.of<RecordingVoice>(context);
    if (loading) {
      playAudio.playCustomAudioFile(vocabulary.audioFile);
      loading = false;
    }

    print(recording.getListResult);
    print(recording.getBestResult);
    
    //get best result
    if(recording.getBestResult != vocabulary.vocab){
      recording.getListResult.forEach((element) {
        if (element.recognizedWords.toLowerCase() == vocabulary.vocab.toLowerCase()) recording.setBestResult(element.recognizedWords);
        return;
      });
    }

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
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black
                                          .withOpacity(blackOpacity)),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 270,
                                        child: Stack(
                                          children: <Widget>[
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 270,
                                              decoration: BoxDecoration(
                                                  // color: Colors.blue,
                                                  image: DecorationImage(
                                                      image: Image.asset(
                                                              'assets/board4.jpeg')
                                                          .image,
                                                      fit: BoxFit.scaleDown)),
                                            ),
                                            Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 270,
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Container(
                                                      height: 100,
                                                      width: 150,
                                                      // color: Colors.blue,
                                                      margin:
                                                          EdgeInsets.all(5.0),
                                                      child: FadeInImage
                                                          .assetNetwork(
                                                        placeholder:
                                                            'assets/waiting_image.gif',
                                                        image: vocabulary.image,
                                                        fit: BoxFit.scaleDown,
                                                        fadeInCurve:
                                                            Curves.bounceIn,
                                                      ),
                                                    ),
                                                    SizedBox(height: 30),
                                                    Container(
                                                      height: 40,
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          AutoSizeText(
                                                            '${vocabulary.vocab}',
                                                            maxLines: 1,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.blue,
                                                              fontSize: 40,
                                                            ),
                                                          ),
                                                          SizedBox(width: 20),
                                                          GestureDetector(
                                                            onTap: () {
                                                              playAudio
                                                                  .playCustomAudioFile(
                                                                      vocabulary
                                                                          .audioFile);
                                                            },
                                                            child: Speaker(
                                                                size: 35),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Microphone(),
                                SizedBox(
                                  height: 10,
                                ),
                                _textResult(
                                    recording.getBestResult, vocabulary.vocab),
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
