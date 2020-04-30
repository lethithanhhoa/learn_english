import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:learn_english/ui/state/detail_word_state.dart';
import 'package:learn_english/ui/state/index.dart';
import 'package:provider/provider.dart';
import 'package:learn_english/ui/modules/audio_player.dart';

class DetailWord extends StatelessWidget {
  List<Vocabulary> vocabList;
  int index;
  DetailWord({this.vocabList, this.index});

  bool loading = true;
  AudioPlayer playAudio = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    Index _index = Provider.of<Index>(context);
    DetailWordState detailWordState = Provider.of<DetailWordState>(context);
    if (loading) {
      _index.setIndex(index);
      loading = false;
    }
    return Scaffold(
      backgroundColor: Colors.green[100],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: <Widget>[
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.bottomRight,
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        playAudio.playClickSound();
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.close,
                        color: Colors.grey,
                        size: 30,
                      ),
                    )),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        playAudio.playClickSound();
                        detailWordState.setState();
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.width - 60.0,
                        width: MediaQuery.of(context).size.width,
                        child: !detailWordState.getState
                            ? Container(
                                height:
                                    MediaQuery.of(context).size.width - 40.0,
                                width: MediaQuery.of(context).size.width,
                                alignment: Alignment.center,
                                color: Colors.white,
                                child: Text(
                                  vocabList[_index.getIndex].mean,
                                  style: TextStyle(
                                      color: Colors.blue[400], fontSize: 40),
                                ),
                              )
                            : Container(
                                height:
                                    MediaQuery.of(context).size.width - 40.0,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.white,
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.width -
                                              40.0,
                                      width: MediaQuery.of(context).size.width,
                                      alignment: Alignment.topRight,
                                      child: IconButton(
                                          icon: Icon(
                                            Icons.volume_up,
                                            size: 40,
                                            color: Colors.orange[300],
                                          ),
                                          onPressed: () {
                                            playAudio.playCustomAudioFile(
                                                vocabList[_index.getIndex]
                                                    .audioFile);
                                          }),
                                    ),
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.width -
                                              40.0,
                                      width: MediaQuery.of(context).size.width,
                                      child: Column(
                                        children: <Widget>[
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsets.all(20.0),
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: Image.network(
                                                              vocabList[_index
                                                                      .getIndex]
                                                                  .image)
                                                          .image,
                                                      fit: BoxFit.scaleDown),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            vocabList[_index.getIndex].vocab,
                                            style: TextStyle(
                                                fontSize: 45,
                                                color: Colors.green),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                            // padding: EdgeInsets.only(left: 0.0),
                            child: Icon(
                              Icons.keyboard_arrow_left,
                              size: 60,
                              color: (_index.getIndex == 0)
                                  ? Colors.grey[400]
                                  : Colors.white,
                            ),
                            onTap: (_index.getIndex == 0)
                                ? null
                                : () {
                                  playAudio.playClickSound();
                                    detailWordState.setStateToTrue();
                                    _index.decrement();
                                  }),
                        GestureDetector(
                            // padding: EdgeInsets.only(right: 35.0),

                            child: Icon(
                              Icons.keyboard_arrow_right,
                              size: 60,
                              color: (_index.getIndex == vocabList.length - 1)
                                  ? Colors.grey[400]
                                  : Colors.white,
                            ),
                            onTap: (_index.getIndex == vocabList.length - 1)
                                ? null
                                : () {
                                  playAudio.playClickSound();
                                    detailWordState.setStateToTrue();
                                    _index.increment();
                                  }),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
