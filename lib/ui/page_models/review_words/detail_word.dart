import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:learn_english/ui/common/speaker.dart';
import 'package:learn_english/ui/state/detail_word_state.dart';
import 'package:learn_english/ui/state/index.dart';
import 'package:provider/provider.dart';
import 'package:learn_english/ui/modules/audio_player.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

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
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: constraints.copyWith(
              minHeight: constraints.maxHeight,
              maxHeight: double.infinity,
            ),
            child: IntrinsicHeight(
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: Image.asset('assets/bg2.jpg').image,
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                playAudio.playClickSound();
                                detailWordState.setState();
                              },
                              child: Container(
                                height: (MediaQuery.of(context).size.width > 500)
                                    ? 400
                                    : MediaQuery.of(context).size.width - 80.0,
                                width: (MediaQuery.of(context).size.width > 500)
                                    ? 500
                                    : MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: !detailWordState.getState
                                    ? Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          border: Border.all(
                                            color: Colors.green,
                                            width: 2.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(5.0),
                                          child: AutoSizeText(
                                            vocabList[_index.getIndex].mean,
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.charm(
                                              textStyle: TextStyle(
                                                  color: Colors.blue[400],
                                                  fontSize: (MediaQuery.of(context).size.width > 500) ? 60 : 40),
                                            ),
                                          ),
                                        ),
                                      )
                                    : Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          border: Border.all(
                                            color: Colors.green,
                                            width: 2.0,
                                          ),
                                        ),
                                        child: Stack(
                                          children: <Widget>[
                                            Container(
                                              alignment: Alignment.center,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Expanded(
                                                      child: Padding(
                                                    padding:
                                                        EdgeInsets.all(20.0),
                                                    child: Center(
                                                      child: Image.network(
                                                          vocabList[_index
                                                                  .getIndex]
                                                              .image),
                                                    ),
                                                  )),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 5),
                                                    child: AutoSizeText(
                                                      vocabList[_index.getIndex]
                                                          .vocab,
                                                      maxLines: 1,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: (MediaQuery.of(context).size.width > 500)
                                                              ? 60
                                                              : 40,
                                                          color:
                                                              Colors.blue[400]),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: (MediaQuery.of(context).size.width > 500)
                                                  ? 400
                                                  : MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      40.0,
                                              width: (MediaQuery.of(context).size.width > 500)
                                                  ? 500
                                                  : MediaQuery.of(context)
                                                      .size
                                                      .width,
                                              alignment: Alignment.topRight,
                                              child: GestureDetector(
                                                  child: (kIsWeb)
                                                      ? Speaker(size: 80)
                                                      : Speaker(size: 60),
                                                  onTap: () {
                                                    playAudio
                                                        .playCustomAudioFile(
                                                            vocabList[_index
                                                                    .getIndex]
                                                                .audioFile);
                                                  }),
                                            ),
                                          ],
                                        ),
                                      ),
                              ),
                            ),
                            Container(
                              width: (kIsWeb)
                                  ? 500
                                  : MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  GestureDetector(
                                      // padding: EdgeInsets.only(left: 0.0),
                                      child: Icon(
                                        Icons.keyboard_arrow_left,
                                        size: (MediaQuery.of(context).size.width > 500) ? 80 : 60,
                                        color: (_index.getIndex == 0)
                                            ? Colors.grey[400]
                                            : Colors.green,
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
                                        size: (MediaQuery.of(context).size.width > 500) ? 80 : 60,
                                        color: (_index.getIndex ==
                                                vocabList.length - 1)
                                            ? Colors.grey[400]
                                            : Colors.green,
                                      ),
                                      onTap: (_index.getIndex ==
                                              vocabList.length - 1)
                                          ? null
                                          : () {
                                              playAudio.playClickSound();
                                              detailWordState.setStateToTrue();
                                              _index.increment();
                                            }),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
