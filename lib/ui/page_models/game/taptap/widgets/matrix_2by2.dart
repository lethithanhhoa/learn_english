import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/provider/taptap_level_state.dart';
import 'package:learn_english/ui/page_models/game/taptap/widgets/cell.dart';
import 'package:provider/provider.dart';

class Matrix2By2 extends StatelessWidget {
  List<Cell> widgets;
  Matrix2By2({this.widgets});
  @override
  Widget build(BuildContext context) {
    LevelState levelState = Provider.of<LevelState>(context);
    // levelState.loadNewCurWidget();
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
                                  padding: EdgeInsets.all(5.0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height,
                                    decoration: BoxDecoration(
                                      color: levelState.getWidgetState(0)
                                          ? Colors.yellow.withOpacity(0.3)
                                          : Colors.white.withOpacity(0),
                                      borderRadius:
                                          BorderRadius.circular(15.0),
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
                                  padding: EdgeInsets.all(5.0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height,
                                    decoration: BoxDecoration(
                                      color: levelState.getWidgetState(1)
                                          ? Colors.yellow.withOpacity(0.3)
                                          : Colors.white.withOpacity(0),
                                      borderRadius:
                                          BorderRadius.circular(15.0),
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
                                  padding: EdgeInsets.all(5.0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height,
                                    decoration: BoxDecoration(
                                      color: levelState.getWidgetState(2)
                                          ? Colors.yellow.withOpacity(0.3)
                                          : Colors.white.withOpacity(0),
                                      borderRadius:
                                          BorderRadius.circular(15.0),
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
                                  padding: EdgeInsets.all(5.0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height,
                                    decoration: BoxDecoration(
                                      color: levelState.getWidgetState(3)
                                          ? Colors.yellow.withOpacity(0.3)
                                          : Colors.white.withOpacity(0),
                                      borderRadius:
                                          BorderRadius.circular(15.0),
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
