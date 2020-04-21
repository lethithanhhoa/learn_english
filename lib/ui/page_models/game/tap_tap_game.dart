import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:learn_english/ui/page_models/game/cell.dart';
import 'package:learn_english/ui/page_models/game/image_cell.dart';
import 'package:learn_english/ui/page_models/game/text_cell.dart';
import 'package:provider/provider.dart';
import 'package:learn_english/ui/page_models/game/matrix_2by2_state.dart';

class TapTapGame extends StatelessWidget {
  List<Vocabulary> vocabList;

  TapTapGame({this.vocabList});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Matrix2By2State(),
        )
      ],
      child: Matrix2By2(
        vocabList: vocabList,
      ),
    );
  }
}

class Matrix2By2 extends StatelessWidget {
  List<Vocabulary> vocabList;
  Matrix2By2({this.vocabList});
  bool loading = true;
  int firstIndex = 0;
  int secondIndex = 0;
  List<Cell> widgets;
  @override
  Widget build(BuildContext context) {
    Matrix2By2State matrix2by2state = Provider.of<Matrix2By2State>(context);
    print(matrix2by2state.getForWidgetState);
    if (loading == true) {
      Random random = Random();
      firstIndex = random.nextInt(vocabList.length);
      do {
        secondIndex = random.nextInt(vocabList.length);
      } while (secondIndex == firstIndex);

      widgets = [
        ImageCell(vocabulary: vocabList[firstIndex]),
        TextCell(
          vocabulary: vocabList[firstIndex],
        ),
        ImageCell(
          vocabulary: vocabList[secondIndex],
        ),
        TextCell(
          vocabulary: vocabList[secondIndex],
        )
      ];
      widgets.shuffle();
      loading = false;
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.width,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: (matrix2by2state.getResultOfFirstWidget == 0)
                            ? () {
                                matrix2by2state.setFirstWidgetState(
                                    widgets[0].vocabulary.vocab);
                              }
                            : null,
                        child: (matrix2by2state.getResultOfFirstWidget == 1)
                            ? Container()
                            : Transform.scale(
                                scale: matrix2by2state.getFirstWidgetState
                                    ? 1.05
                                    : 1.0,
                                child: Stack(
                                  children: <Widget>[
                                    widgets[0],
                                    Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          color: matrix2by2state
                                                  .getFirstWidgetState
                                              ? Colors.yellow.withOpacity(0.3)
                                              : Colors.white.withOpacity(0),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: (matrix2by2state.getResultOfSecondWidget == 0)
                            ? () {
                                matrix2by2state.setSecondWidgetState(
                                    widgets[1].vocabulary.vocab);
                              }
                            : null,
                        child: (matrix2by2state.getResultOfSecondWidget == 1)
                            ? Container()
                            : Transform.scale(
                                scale: matrix2by2state.getSecondWidgetState
                                    ? 1.05
                                    : 1.0,
                                child: Stack(
                                  children: <Widget>[
                                    widgets[1],
                                    Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          color: matrix2by2state
                                                  .getSecondWidgetState
                                              ? Colors.yellow.withOpacity(0.3)
                                              : Colors.white.withOpacity(0),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: (matrix2by2state.getResultOfThirdWidget == 0)
                            ? () {
                                matrix2by2state.setThirdWidgetState(
                                    widgets[2].vocabulary.vocab);
                              }
                            : null,
                        child: (matrix2by2state.getResultOfThirdWidget == 1)
                            ? Container()
                            : Transform.scale(
                                scale: matrix2by2state.getThirdWidgetState
                                    ? 1.05
                                    : 1.0,
                                child: Stack(
                                  children: <Widget>[
                                    widgets[2],
                                    Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          color: matrix2by2state
                                                  .getThirdWidgetState
                                              ? Colors.yellow.withOpacity(0.3)
                                              : Colors.white.withOpacity(0),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                          onTap: (matrix2by2state.getResultOfForWidget == 0)
                              ? () {
                                  matrix2by2state.setForWidgetState(
                                      widgets[3].vocabulary.vocab);
                                }
                              : null,
                          child: (matrix2by2state.getResultOfForWidget == 1)
                              ? Container()
                              : Transform.scale(
                                  scale: matrix2by2state.getForWidgetState
                                      ? 1.05
                                      : 1.0,
                                  child: Stack(
                                    children: <Widget>[
                                      widgets[3],
                                      Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Container(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            color: matrix2by2state
                                                    .getForWidgetState
                                                ? Colors.yellow.withOpacity(0.3)
                                                : Colors.white.withOpacity(0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ))),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // checkTap(Matrix2By2State matrix2by2state){

  // }

}
