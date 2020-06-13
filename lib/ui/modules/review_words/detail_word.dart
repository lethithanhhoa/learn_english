import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:learn_english/ui/common/side_menu_bar.dart';
import 'package:learn_english/ui/common/speaker.dart';
import 'package:learn_english/ui/modules/audio/audio_local_player.dart';
import 'package:learn_english/ui/modules/audio/audio_player.dart';
import 'package:learn_english/ui/provider/index.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../../general_parameter.dart';

class DetailWord extends StatefulWidget {
  List<Vocabulary> vocabList;
  int index;
  DetailWord({this.vocabList, this.index});
  _DetailWordState createState() => _DetailWordState();
}

class _DetailWordState extends State<DetailWord> with TickerProviderStateMixin {
  bool loading = true;
  AudioCustomPlayer playAudio = AudioCustomPlayer();
  AudioLocalPlayer audioLocalPlayer = AudioLocalPlayer();

  AnimationController _controller;
  Animation<double> _frontScale;
  Animation<double> _backScale;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _frontScale = Tween(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.0, 0.5, curve: Curves.easeIn),
    ));
    _backScale = CurvedAnimation(
      parent: _controller,
      curve: Interval(0.5, 1.0, curve: Curves.easeOut),
    );
  }

  @override
  Widget build(BuildContext context) {
    Index _index = Provider.of<Index>(context);
    if (loading) {
      _index.setIndex(widget.index);
      loading = false;
    }
    return Scaffold(
      drawer: kIsWeb ? NavigateDrawer() : null,
      appBar: kIsWeb
          ? AppBar(
              title: Text(
                'Word',
                style: GoogleFonts.handlee(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
            )
          : null,
      body: SingleChildScrollView(
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
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_controller.isCompleted || _controller.velocity > 0)
                          _controller.reverse();
                        else
                          _controller.forward();
                      });
                    },
                    child: Stack(
                      children: <Widget>[
                        new AnimatedBuilder(
                          child: Container(
                            height: (MediaQuery.of(context).size.width > 500)
                                ? 400
                                : MediaQuery.of(context).size.width,
                            width: (MediaQuery.of(context).size.width > 500)
                                ? 500
                                : MediaQuery.of(context).size.width,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(
                                color: Colors.green,
                                width: 2.0,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: AutoSizeText(
                                widget.vocabList[_index.getIndex].mean,
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.charm(
                                  textStyle: TextStyle(
                                      color: Colors.blue,
                                      fontSize:
                                          (MediaQuery.of(context).size.width >
                                                  500)
                                              ? 50
                                              : 35),
                                ),
                              ),
                            ),
                          ),
                          animation: _backScale,
                          builder: (BuildContext context, Widget child) {
                            final Matrix4 transform = new Matrix4.identity()
                              ..scale(1.0, _backScale.value, 1.0);
                            return new Transform(
                              transform: transform,
                              alignment: FractionalOffset.center,
                              child: child,
                            );
                          },
                        ),
                        new AnimatedBuilder(
                          child: Container(
                            height: (MediaQuery.of(context).size.width > 500)
                                ? 400
                                : MediaQuery.of(context).size.width,
                            width: (MediaQuery.of(context).size.width > 500)
                                ? 500
                                : MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(
                                color: Colors.green,
                                width: 2.0,
                              ),
                            ),
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  height:
                                      (MediaQuery.of(context).size.width > 500)
                                          ? 400
                                          : MediaQuery.of(context).size.width,
                                  width:
                                      (MediaQuery.of(context).size.width > 500)
                                          ? 500
                                          : MediaQuery.of(context).size.width,
                                  alignment: Alignment.center,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Expanded(
                                          child: Padding(
                                        padding: EdgeInsets.all(20.0),
                                        child: Center(
                                          child: Image.network(widget
                                              .vocabList[_index.getIndex]
                                              .image),
                                        ),
                                      )),
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 5),
                                        child: AutoSizeText(
                                          widget
                                              .vocabList[_index.getIndex].vocab,
                                          maxLines: 1,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: (MediaQuery.of(context)
                                                          .size
                                                          .width >
                                                      500)
                                                  ? 50
                                                  : 35,
                                              color: Colors.blue),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height:
                                      (MediaQuery.of(context).size.width > 500)
                                          ? 400
                                          : MediaQuery.of(context).size.width,
                                  width:
                                      (MediaQuery.of(context).size.width > 500)
                                          ? 500
                                          : MediaQuery.of(context).size.width,
                                  alignment: Alignment.topRight,
                                  child: GestureDetector(
                                      child:
                                          (MediaQuery.of(context).size.width >
                                                  500)
                                              ? Speaker(size: 50)
                                              : Speaker(size: 37),
                                      onTap: () {
                                        playAudio.playCustomAudioFile(widget
                                                .vocabList[_index.getIndex]
                                                .audioFile
                                            // ,
                                            // widget.vocabList[_index.getIndex]
                                            //     .timeStartAudio,
                                            // widget.vocabList[_index.getIndex]
                                            //     .timeEndAudio
                                            );
                                      }),
                                ),
                              ],
                            ),
                          ),
                          animation: _frontScale,
                          builder: (BuildContext context, Widget child) {
                            final Matrix4 transform = new Matrix4.identity()
                              ..scale(1.0, _frontScale.value, 1.0);
                            return new Transform(
                              transform: transform,
                              alignment: FractionalOffset.center,
                              child: child,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: (MediaQuery.of(context).size.width > 500) ? 80 : 60,
                    width: (MediaQuery.of(context).size.width > 500)
                        ? 500
                        : MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                            // padding: EdgeInsets.only(left: 0.0),
                            child: Icon(
                              Icons.keyboard_arrow_left,
                              size: (MediaQuery.of(context).size.width > 500)
                                  ? 80
                                  : 60,
                              color: (_index.getIndex == 0)
                                  ? Colors.grey[400]
                                  : highLightTextAtRanking,
                            ),
                            onTap: (_index.getIndex == 0)
                                ? null
                                : () {
                                    audioLocalPlayer.playClickSound();
                                    _index.decrement();
                                  }),
                        GestureDetector(
                            // padding: EdgeInsets.only(right: 35.0),

                            child: Icon(
                              Icons.keyboard_arrow_right,
                              size: (MediaQuery.of(context).size.width > 500)
                                  ? 80
                                  : 60,
                              color: (_index.getIndex ==
                                      widget.vocabList.length - 1)
                                  ? Colors.grey[400]
                                  : highLightTextAtRanking,
                            ),
                            onTap:
                                (_index.getIndex == widget.vocabList.length - 1)
                                    ? null
                                    : () {
                                        audioLocalPlayer.playClickSound();
                                        _index.increment();
                                      }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
