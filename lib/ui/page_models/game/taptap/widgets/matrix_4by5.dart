import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/provider/taptap_level_state.dart';
import 'package:learn_english/ui/page_models/game/taptap/widgets/cell.dart';
import 'package:provider/provider.dart';

class Matrix4By5 extends StatelessWidget {
  List<Cell> widgets;
  Matrix4By5({this.widgets});
  @override
  Widget build(BuildContext context) {
    LevelState levelState = Provider.of<LevelState>(context);
    return Column(children: <Widget>[
      Expanded(
        child: Row(
          children: [
            Expanded(
                child: GestureDetector(
                    onTap: (!levelState.getIsFalse)
                        ? () {
                            levelState.setWidgetState(
                                0, widgets[0].vocabulary);
                          }
                        : null,
                    child: (levelState.getIsCorrectWidget(0) == true)
                        ? Container()
                        : Transform.scale(
                            scale: levelState.getWidgetState(0) ? 1.05 : 1.0,
                            child: Stack(
                              children: [
                                widgets[0],
                                Padding(
                                  padding: EdgeInsets.all(2.5),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height,
                                    decoration: BoxDecoration(
                                      color: levelState.getWidgetState(0)
                                          ? Colors.yellow.withOpacity(0.3)
                                          : Colors.white.withOpacity(0),
                                      borderRadius:
                                          BorderRadius.circular(6.0),
                                    ),
                                  ),
                                )
                              ],
                            )))),
            Expanded(
                child: GestureDetector(
                    onTap: (!levelState.getIsFalse)
                        ? () {
                            levelState.setWidgetState(
                                1, widgets[1].vocabulary);
                          }
                        : null,
                    child: (levelState.getIsCorrectWidget(1) == true)
                        ? Container()
                        : Transform.scale(
                            scale: levelState.getWidgetState(1) ? 1.05 : 1.0,
                            child: Stack(
                              children: [
                                widgets[1],
                                Padding(
                                  padding: EdgeInsets.all(2.5),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height,
                                    decoration: BoxDecoration(
                                      color: levelState.getWidgetState(1)
                                          ? Colors.yellow.withOpacity(0.3)
                                          : Colors.white.withOpacity(0),
                                      borderRadius:
                                          BorderRadius.circular(6.0),
                                    ),
                                  ),
                                )
                              ],
                            )))),
            Expanded(
                child: GestureDetector(
                    onTap: (!levelState.getIsFalse)
                        ? () {
                            levelState.setWidgetState(
                                2, widgets[2].vocabulary);
                          }
                        : null,
                    child: (levelState.getIsCorrectWidget(2) == true)
                        ? Container()
                        : Transform.scale(
                            scale: levelState.getWidgetState(2) ? 1.05 : 1.0,
                            child: Stack(
                              children: [
                                widgets[2],
                                Padding(
                                  padding: EdgeInsets.all(2.5),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height,
                                    decoration: BoxDecoration(
                                      color: levelState.getWidgetState(2)
                                          ? Colors.yellow.withOpacity(0.3)
                                          : Colors.white.withOpacity(0),
                                      borderRadius:
                                          BorderRadius.circular(6.0),
                                    ),
                                  ),
                                )
                              ],
                            )))),
            Expanded(
                child: GestureDetector(
                    onTap: (!levelState.getIsFalse)
                        ? () {
                            levelState.setWidgetState(
                                3, widgets[3].vocabulary);
                          }
                        : null,
                    child: (levelState.getIsCorrectWidget(3) == true)
                        ? Container()
                        : Transform.scale(
                            scale: levelState.getWidgetState(3) ? 1.05 : 1.0,
                            child: Stack(
                              children: [
                                widgets[3],
                                Padding(
                                  padding: EdgeInsets.all(2.5),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height,
                                    decoration: BoxDecoration(
                                      color: levelState.getWidgetState(3)
                                          ? Colors.yellow.withOpacity(0.3)
                                          : Colors.white.withOpacity(0),
                                      borderRadius:
                                          BorderRadius.circular(6.0),
                                    ),
                                  ),
                                )
                              ],
                            )))),
            Expanded(
                child: GestureDetector(
                    onTap: (!levelState.getIsFalse)
                        ? () {
                            levelState.setWidgetState(
                                4, widgets[4].vocabulary);
                          }
                        : null,
                    child: (levelState.getIsCorrectWidget(4) == true)
                        ? Container()
                        : Transform.scale(
                            scale: levelState.getWidgetState(4) ? 1.05 : 1.0,
                            child: Stack(
                              children: [
                                widgets[4],
                                Padding(
                                  padding: EdgeInsets.all(2.5),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height,
                                    decoration: BoxDecoration(
                                      color: levelState.getWidgetState(4)
                                          ? Colors.yellow.withOpacity(0.3)
                                          : Colors.white.withOpacity(0),
                                      borderRadius:
                                          BorderRadius.circular(6.0),
                                    ),
                                  ),
                                )
                              ],
                            )))),
          ],
        ),
      ),
      Expanded(
        child: Row(
          children: [
            Expanded(
                child: GestureDetector(
                    onTap: (!levelState.getIsFalse)
                        ? () {
                            levelState.setWidgetState(
                                5, widgets[5].vocabulary);
                          }
                        : null,
                    child: (levelState.getIsCorrectWidget(5) == true)
                        ? Container()
                        : Transform.scale(
                            scale: levelState.getWidgetState(5) ? 1.05 : 1.0,
                            child: Stack(
                              children: [
                                widgets[5],
                                Padding(
                                  padding: EdgeInsets.all(2.5),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height,
                                    decoration: BoxDecoration(
                                      color: levelState.getWidgetState(5)
                                          ? Colors.yellow.withOpacity(0.3)
                                          : Colors.white.withOpacity(0),
                                      borderRadius:
                                          BorderRadius.circular(6.0),
                                    ),
                                  ),
                                )
                              ],
                            )))),
            Expanded(
                child: GestureDetector(
                    onTap: (!levelState.getIsFalse)
                        ? () {
                            levelState.setWidgetState(
                                6, widgets[6].vocabulary);
                          }
                        : null,
                    child: (levelState.getIsCorrectWidget(6) == true)
                        ? Container()
                        : Transform.scale(
                            scale: levelState.getWidgetState(6) ? 1.05 : 1.0,
                            child: Stack(
                              children: [
                                widgets[6],
                                Padding(
                                  padding: EdgeInsets.all(2.5),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height,
                                    decoration: BoxDecoration(
                                      color: levelState.getWidgetState(6)
                                          ? Colors.yellow.withOpacity(0.3)
                                          : Colors.white.withOpacity(0),
                                      borderRadius:
                                          BorderRadius.circular(6.0),
                                    ),
                                  ),
                                )
                              ],
                            )))),
            Expanded(
                child: GestureDetector(
                    onTap: (!levelState.getIsFalse)
                        ? () {
                            levelState.setWidgetState(
                                7, widgets[7].vocabulary);
                          }
                        : null,
                    child: (levelState.getIsCorrectWidget(7) == true)
                        ? Container()
                        : Transform.scale(
                            scale: levelState.getWidgetState(7) ? 1.05 : 1.0,
                            child: Stack(
                              children: [
                                widgets[7],
                                Padding(
                                  padding: EdgeInsets.all(2.5),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height,
                                    decoration: BoxDecoration(
                                      color: levelState.getWidgetState(7)
                                          ? Colors.yellow.withOpacity(0.3)
                                          : Colors.white.withOpacity(0),
                                      borderRadius:
                                          BorderRadius.circular(6.0),
                                    ),
                                  ),
                                )
                              ],
                            )))),
            Expanded(
                child: GestureDetector(
                    onTap: (!levelState.getIsFalse)
                        ? () {
                            levelState.setWidgetState(
                                8, widgets[8].vocabulary);
                          }
                        : null,
                    child: (levelState.getIsCorrectWidget(8) == true)
                        ? Container()
                        : Transform.scale(
                            scale: levelState.getWidgetState(8) ? 1.05 : 1.0,
                            child: Stack(
                              children: [
                                widgets[8],
                                Padding(
                                  padding: EdgeInsets.all(2.5),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height,
                                    decoration: BoxDecoration(
                                      color: levelState.getWidgetState(8)
                                          ? Colors.yellow.withOpacity(0.3)
                                          : Colors.white.withOpacity(0),
                                      borderRadius:
                                          BorderRadius.circular(6.0),
                                    ),
                                  ),
                                )
                              ],
                            )))),
            Expanded(
                child: GestureDetector(
                    onTap: (!levelState.getIsFalse)
                        ? () {
                            levelState.setWidgetState(
                                9, widgets[9].vocabulary);
                          }
                        : null,
                    child: (levelState.getIsCorrectWidget(9) == true)
                        ? Container()
                        : Transform.scale(
                            scale: levelState.getWidgetState(9) ? 1.05 : 1.0,
                            child: Stack(
                              children: [
                                widgets[9],
                                Padding(
                                  padding: EdgeInsets.all(2.5),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height,
                                    decoration: BoxDecoration(
                                      color: levelState.getWidgetState(9)
                                          ? Colors.yellow.withOpacity(0.3)
                                          : Colors.white.withOpacity(0),
                                      borderRadius:
                                          BorderRadius.circular(6.0),
                                    ),
                                  ),
                                )
                              ],
                            )))),
          ],
        ),
      ),
      Expanded(
        child: Row(
          children: [
            Expanded(
                child: GestureDetector(
                    onTap: (!levelState.getIsFalse)
                        ? () {
                            levelState.setWidgetState(
                                10, widgets[10].vocabulary);
                          }
                        : null,
                    child: (levelState.getIsCorrectWidget(10) == true)
                        ? Container()
                        : Transform.scale(
                            scale: levelState.getWidgetState(10) ? 1.05 : 1.0,
                            child: Stack(
                              children: [
                                widgets[10],
                                Padding(
                                  padding: EdgeInsets.all(2.5),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height,
                                    decoration: BoxDecoration(
                                      color: levelState.getWidgetState(10)
                                          ? Colors.yellow.withOpacity(0.3)
                                          : Colors.white.withOpacity(0),
                                      borderRadius:
                                          BorderRadius.circular(6.0),
                                    ),
                                  ),
                                )
                              ],
                            )))),
            Expanded(
                child: GestureDetector(
                    onTap: (!levelState.getIsFalse)
                        ? () {
                            levelState.setWidgetState(
                                11, widgets[11].vocabulary);
                          }
                        : null,
                    child: (levelState.getIsCorrectWidget(11) == true)
                        ? Container()
                        : Transform.scale(
                            scale: levelState.getWidgetState(11) ? 1.05 : 1.0,
                            child: Stack(
                              children: [
                                widgets[11],
                                Padding(
                                  padding: EdgeInsets.all(2.5),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height,
                                    decoration: BoxDecoration(
                                      color: levelState.getWidgetState(11)
                                          ? Colors.yellow.withOpacity(0.3)
                                          : Colors.white.withOpacity(0),
                                      borderRadius:
                                          BorderRadius.circular(6.0),
                                    ),
                                  ),
                                )
                              ],
                            )))),
            Expanded(
                child: GestureDetector(
                    onTap: (!levelState.getIsFalse)
                        ? () {
                            levelState.setWidgetState(
                                12, widgets[12].vocabulary);
                          }
                        : null,
                    child: (levelState.getIsCorrectWidget(12) == true)
                        ? Container()
                        : Transform.scale(
                            scale: levelState.getWidgetState(12) ? 1.05 : 1.0,
                            child: Stack(
                              children: [
                                widgets[12],
                                Padding(
                                  padding: EdgeInsets.all(2.5),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height,
                                    decoration: BoxDecoration(
                                      color: levelState.getWidgetState(12)
                                          ? Colors.yellow.withOpacity(0.3)
                                          : Colors.white.withOpacity(0),
                                      borderRadius:
                                          BorderRadius.circular(6.0),
                                    ),
                                  ),
                                )
                              ],
                            )))),
            Expanded(
                child: GestureDetector(
                    onTap: (!levelState.getIsFalse)
                        ? () {
                            levelState.setWidgetState(
                                13, widgets[13].vocabulary);
                          }
                        : null,
                    child: (levelState.getIsCorrectWidget(13) == true)
                        ? Container()
                        : Transform.scale(
                            scale: levelState.getWidgetState(13) ? 1.05 : 1.0,
                            child: Stack(
                              children: [
                                widgets[13],
                                Padding(
                                  padding: EdgeInsets.all(2.5),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height,
                                    decoration: BoxDecoration(
                                      color: levelState.getWidgetState(13)
                                          ? Colors.yellow.withOpacity(0.3)
                                          : Colors.white.withOpacity(0),
                                      borderRadius:
                                          BorderRadius.circular(6.0),
                                    ),
                                  ),
                                )
                              ],
                            )))),
            Expanded(
                child: GestureDetector(
                    onTap: (!levelState.getIsFalse)
                        ? () {
                            levelState.setWidgetState(
                                14, widgets[14].vocabulary);
                          }
                        : null,
                    child: (levelState.getIsCorrectWidget(14) == true)
                        ? Container()
                        : Transform.scale(
                            scale: levelState.getWidgetState(14) ? 1.05 : 1.0,
                            child: Stack(
                              children: [
                                widgets[14],
                                Padding(
                                  padding: EdgeInsets.all(2.5),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height,
                                    decoration: BoxDecoration(
                                      color: levelState.getWidgetState(14)
                                          ? Colors.yellow.withOpacity(0.3)
                                          : Colors.white.withOpacity(0),
                                      borderRadius:
                                          BorderRadius.circular(6.0),
                                    ),
                                  ),
                                )
                              ],
                            )))),
          ],
        ),
      ),
      Expanded(
        child: Row(
          children: [
            Expanded(
                child: GestureDetector(
                    onTap: (!levelState.getIsFalse)
                        ? () {
                            levelState.setWidgetState(
                                15, widgets[15].vocabulary);
                          }
                        : null,
                    child: (levelState.getIsCorrectWidget(15) == true)
                        ? Container()
                        : Transform.scale(
                            scale: levelState.getWidgetState(15) ? 1.05 : 1.0,
                            child: Stack(
                              children: [
                                widgets[15],
                                Padding(
                                  padding: EdgeInsets.all(2.5),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height,
                                    decoration: BoxDecoration(
                                      color: levelState.getWidgetState(15)
                                          ? Colors.yellow.withOpacity(0.3)
                                          : Colors.white.withOpacity(0),
                                      borderRadius:
                                          BorderRadius.circular(6.0),
                                    ),
                                  ),
                                )
                              ],
                            )))),
            Expanded(
                child: GestureDetector(
                    onTap: (!levelState.getIsFalse)
                        ? () {
                            levelState.setWidgetState(
                                16, widgets[16].vocabulary);
                          }
                        : null,
                    child: (levelState.getIsCorrectWidget(16) == true)
                        ? Container()
                        : Transform.scale(
                            scale: levelState.getWidgetState(16) ? 1.05 : 1.0,
                            child: Stack(
                              children: [
                                widgets[16],
                                Padding(
                                  padding: EdgeInsets.all(2.5),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height,
                                    decoration: BoxDecoration(
                                      color: levelState.getWidgetState(16)
                                          ? Colors.yellow.withOpacity(0.3)
                                          : Colors.white.withOpacity(0),
                                      borderRadius:
                                          BorderRadius.circular(6.0),
                                    ),
                                  ),
                                )
                              ],
                            )))),
            Expanded(
                child: GestureDetector(
                    onTap: (!levelState.getIsFalse)
                        ? () {
                            levelState.setWidgetState(
                                17, widgets[17].vocabulary);
                          }
                        : null,
                    child: (levelState.getIsCorrectWidget(17) == true)
                        ? Container()
                        : Transform.scale(
                            scale: levelState.getWidgetState(17) ? 1.05 : 1.0,
                            child: Stack(
                              children: [
                                widgets[17],
                                Padding(
                                  padding: EdgeInsets.all(2.5),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height,
                                    decoration: BoxDecoration(
                                      color: levelState.getWidgetState(17)
                                          ? Colors.yellow.withOpacity(0.3)
                                          : Colors.white.withOpacity(0),
                                      borderRadius:
                                          BorderRadius.circular(6.0),
                                    ),
                                  ),
                                )
                              ],
                            )))),
            Expanded(
                child: GestureDetector(
                    onTap: (!levelState.getIsFalse)
                        ? () {
                            levelState.setWidgetState(
                                18, widgets[18].vocabulary);
                          }
                        : null,
                    child: (levelState.getIsCorrectWidget(18) == true)
                        ? Container()
                        : Transform.scale(
                            scale: levelState.getWidgetState(18) ? 1.05 : 1.0,
                            child: Stack(
                              children: [
                                widgets[18],
                                Padding(
                                  padding: EdgeInsets.all(2.5),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height,
                                    decoration: BoxDecoration(
                                      color: levelState.getWidgetState(18)
                                          ? Colors.yellow.withOpacity(0.3)
                                          : Colors.white.withOpacity(0),
                                      borderRadius:
                                          BorderRadius.circular(6.0),
                                    ),
                                  ),
                                )
                              ],
                            )))),
            Expanded(
                child: GestureDetector(
                    onTap: (!levelState.getIsFalse)
                        ? () {
                            levelState.setWidgetState(
                                19, widgets[19].vocabulary);
                          }
                        : null,
                    child: (levelState.getIsCorrectWidget(19) == true)
                        ? Container()
                        : Transform.scale(
                            scale: levelState.getWidgetState(19) ? 1.05 : 1.0,
                            child: Stack(
                              children: [
                                widgets[19],
                                Padding(
                                  padding: EdgeInsets.all(2.5),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height,
                                    decoration: BoxDecoration(
                                      color: levelState.getWidgetState(19)
                                          ? Colors.yellow.withOpacity(0.3)
                                          : Colors.white.withOpacity(0),
                                      borderRadius:
                                          BorderRadius.circular(6.0),
                                    ),
                                  ),
                                )
                              ],
                            )))),
          ],
        ),
      ),
    ]);
  }
}
