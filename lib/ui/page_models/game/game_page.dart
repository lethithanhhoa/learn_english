import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:learn_english/core/services/database_service.dart';
import 'package:learn_english/ui/modules/route_name.dart';
import 'package:learn_english/ui/page_models/game/tap_tap_animation.dart';
import 'package:learn_english/ui/pages/loading_page.dart';

class GamePage extends StatefulWidget {
  _GameState createState() => _GameState();
}

class _GameState extends State<GamePage> {
  // List<Vocabulary> list = new List();
  // DatabaseService database = DatabaseService();


  // @override
  // void initState() {
  //   super.initState();
  //   database.getVocabByTypeOfWord().then((data) {
  //     setState(() {
  //       list = data;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return 
    // (list.length == 0)
    //     ? LoadingPage()
    //     : 
        Scaffold(
            backgroundColor: Colors.green[200],
            body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Expanded(
                    child: Transform.rotate(
                      angle: -0.4,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(0),
                              child: Transform.rotate(
                                  angle: -0.8, child: TapTapAnimatedWidget()),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(0),
                              child: Transform.rotate(
                                  angle: 0.2, child: TapTapAnimatedWidget()),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 2 / 3,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          300,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                      child: Stack(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              // Navigator.pushNamed(context, RouteName.matrix4by4,
                              //     arguments: list);
                            },
                            child: Container(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: EdgeInsets.only(top: 50.0),
                                child: Transform.rotate(
                                  angle: -0.8,
                                  child: Stack(
                                    children: <Widget>[
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.width /
                                                2.5,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.5,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: Image.asset(
                                                        'assets/dog4.png')
                                                    .image)),
                                      ),
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.width /
                                                2.5,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.5,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.green[200]),
                                            color:
                                                Colors.white.withOpacity(0.15),
                                            shape: BoxShape.circle),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigator.pushNamed(context, RouteName.matrix2by2,
                              //     arguments: list);
                            },
                            child: Container(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 30, 30),
                                child: Transform.rotate(
                                  angle: -0.7,
                                  child: Stack(
                                    children: <Widget>[
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.width /
                                                2.5,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.5,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: Image.asset(
                                                        'assets/dog2.png')
                                                    .image)),
                                      ),
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.width /
                                                2.5,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.5,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.green[200]),
                                          shape: BoxShape.circle,
                                          color: Colors.white.withOpacity(0.15),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigator.pushNamed(context, RouteName.matrix3by3,
                              //     arguments: list);
                            },
                            child: Container(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(40, 0, 0, 150),
                                child: Transform.rotate(
                                  angle: 0.5,
                                  child: Stack(
                                    children: <Widget>[
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.width /
                                                2.5,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.5,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: Image.asset(
                                                        'assets/dog3.png')
                                                    .image)),
                                      ),
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.width /
                                                2.5,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.5,
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.15),
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: Colors.green[200])),
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
                  ),
                ],
              ),
            ),
          );
  }
}
