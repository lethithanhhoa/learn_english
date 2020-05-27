import 'dart:math';

import 'package:flip_panel/flip_panel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:learn_english/core/services/vocab_service.dart';
import 'package:learn_english/ui/modules/route_name.dart';
import 'package:learn_english/ui/page_models/game/taptap/tap_tap_animation.dart';

class GamePage extends StatefulWidget {
  _GameState createState() => _GameState();
}

class _GameState extends State<GamePage> {
  VocabService _vocabService = VocabService();
  List<Vocabulary> vocabList = [];
  List<Vocabulary> vocabListByType = [];

  @override
  void initState() {
    super.initState();
    _vocabService.getAllVocab().then((value) {
      setState(() {
        vocabList = value;
      });
      value.forEach((element) {
        if (element.type == 1 || element.type == 2) {
          setState(() {
            vocabListByType.add(element);
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final toleranceFactor = 0.033;
    final widthFactor = 0.125;
    final heightFactor = 0.5;

    final random = Random();

    Future<bool> onWillPop() {
      return Future.value(false);
    }

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                // mainAxisSize: MainAxisSize.min,
                children: [0, 1, 2, 3, 4, 5, 6, 7]
                    .map((count) => FlipPanel.stream(
                          itemStream: Stream.fromFuture(Future.delayed(
                              Duration(milliseconds: random.nextInt(20) * 100),
                              () => 1)),
                          itemBuilder: (_, value) => value <= 0
                              ? Container(
                                  color: Colors.white,
                                  width: widthFactor *
                                      MediaQuery.of(context).size.width,
                                  height: heightFactor *
                                      MediaQuery.of(context).size.height /
                                      2.5,
                                )
                              : ClipRect(
                                  child: Align(
                                      alignment: Alignment(
                                          -1.0 +
                                              count * 2 * 0.125 +
                                              count * toleranceFactor,
                                          -1.0),
                                      widthFactor: widthFactor,
                                      heightFactor: heightFactor,
                                      child: Image.asset(
                                        'assets/find.png',
                                        fit: BoxFit.scaleDown,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                2.5,
                                        width: MediaQuery.of(context).size.width,
                                      ))),
                          initValue: 0,
                          spacing: 0.0,
                          direction: FlipDirection.up,
                        ))
                    .toList(),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  0,
                  1,
                  2,
                  3,
                  4,
                  5,
                  6,
                  7,
                ]
                    .map((count) => FlipPanel.stream(
                          itemStream: Stream.fromFuture(Future.delayed(
                              Duration(milliseconds: random.nextInt(20) * 100),
                              () => 1)),
                          itemBuilder: (_, value) => value <= 0
                              ? Container(
                                  color: Colors.white,
                                  width: widthFactor *
                                      MediaQuery.of(context).size.width,
                                  height: heightFactor *
                                      MediaQuery.of(context).size.height /
                                      2.5,
                                )
                              : ClipRect(
                                  child: Align(
                                      alignment: Alignment(
                                          -1.0 +
                                              count * 2 * 0.125 +
                                              count * toleranceFactor,
                                          1.0),
                                      widthFactor: widthFactor,
                                      heightFactor: heightFactor,
                                      child: Image.asset(
                                        'assets/find.png',
                                        fit: BoxFit.scaleDown,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                2.5,
                                        width: MediaQuery.of(context).size.width,
                                      ))),
                          initValue: 0,
                          spacing: 0.0,
                          direction: FlipDirection.down,
                        ))
                    .toList(),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RouteName.taptap,
                        arguments: vocabListByType);
                  },
                  child: TapTapAnimatedWidget(
                      title: 'Tap Tap', imageName: 'bee1.png')),
              // GestureDetector(
              //   onTap: () {
              //     Navigator.pushNamed(context, RouteName.trex,
              //         arguments: vocabListByType);
              //   },
              //   child: TapTapAnimatedWidget(
              //       title: 'Trex', imageName: 'duck.png'),
              // ),

              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RouteName.memory, arguments: vocabList
                      );
                },
                child: TapTapAnimatedWidget(
                    title: 'Memory Card', imageName: 'duck.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
