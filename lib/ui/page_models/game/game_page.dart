import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:learn_english/core/services/database_service.dart';
import 'package:learn_english/ui/modules/route_name.dart';
import 'package:learn_english/ui/pages/loading_page.dart';

class GamePage extends StatefulWidget {
  _GameState createState() => _GameState();
}

class _GameState extends State<GamePage> {
  List<Vocabulary> list = new List();
  Database database = Database();

  @override
  void initState() {
    super.initState();
    database.getVocabByTypeOfWord().then((data) {
      setState(() {
        list = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return (list.length == 0)
        ? LoadingPage()
        : Scaffold(
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
                          child: Transform.rotate(
                              angle: -0.3,
                              child: Container(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                alignment: Alignment.bottomCenter,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Text('Tap',
                                    style: TextStyle(
                                        fontSize: 60,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.lime[900])),
                              )),
                        ),
                        Expanded(
                          child: Transform.rotate(
                            angle: 0.6,
                            child: Container(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              alignment: Alignment.bottomCenter,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                'Tap',
                                style: TextStyle(
                                    fontSize: 60,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.lime[800]),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
                  Container(
                    height: MediaQuery.of(context).size.height * 2 / 3,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                              MediaQuery.of(context).size.width)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(20.0, 0.0, 0, 10.0),
                          child: GestureDetector(
                            child: Container(
                                height: MediaQuery.of(context).size.height / 8,
                                width: MediaQuery.of(context).size.width * 0.5,
                                alignment: Alignment.centerRight,
                                decoration: BoxDecoration(
                                    color: Colors.pink[300],
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(70),
                                        bottomLeft: Radius.circular(0.0))),
                                child: Padding(
                                  padding: EdgeInsets.only(right: 10.0),
                                  child: Text(
                                    'Matrix 2x2',
                                    style: TextStyle(
                                        fontSize: 26, color: Colors.white,),
                                  ),
                                )),
                            onTap: () {
                              Navigator.pushNamed(context, RouteName.matrix2by2,
                                  arguments: list);
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20.0, 0.0, 0, 10.0),
                          child: GestureDetector(
                            child: Container(
                                height: MediaQuery.of(context).size.height / 8,
                                width: MediaQuery.of(context).size.width * 0.75,
                                alignment: Alignment.centerRight,
                                decoration: BoxDecoration(
                                    color: Colors.pink[200],
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(70),
                                        bottomLeft: Radius.circular(0.0))),
                                child: Padding(
                                  padding: EdgeInsets.only(right: 10.0),
                                  child: Text(
                                    'Matrix 3x3',
                                    style: TextStyle(
                                        fontSize: 26, color: Colors.white,),
                                  ),
                                )),
                            onTap: () {},
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20.0, 00.0, 0, 10.0),
                          child: GestureDetector(
                            child: Container(
                                height: MediaQuery.of(context).size.height / 8,
                                width: MediaQuery.of(context).size.width,
                                alignment: Alignment.centerRight,
                                decoration: BoxDecoration(
                                    color: Colors.pink[100],
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(70),
                                        bottomLeft: Radius.circular(0.0))),
                                child: Padding(
                                  padding: EdgeInsets.only(right: 10.0),
                                  child: Text(
                                    'Matrix 4x4',
                                    style: TextStyle(
                                        fontSize: 26, color: Colors.white,),
                                  ),
                                )),
                            onTap: () {
                              Navigator.pushNamed(context, RouteName.matrix4by4,
                                  arguments: list);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            //     Padding(
            //       padding: const EdgeInsets.symmetric( horizontal: 20.0),
            //       child: Center(
            //   child: Container(
            //       height: MediaQuery.of(context).size.width-60,
            //       width: MediaQuery.of(context).size.width,
            //       // color: Colors.white,
            //       child: Stack(
            //         children: <Widget>[

            //           Container(
            //             height: MediaQuery.of(context).size.width,
            //             width: MediaQuery.of(context).size.width,
            //             alignment: Alignment.topCenter,
            //             child: Container(

            //               height: MediaQuery.of(context).size.width / 2.3,
            //               width: MediaQuery.of(context).size.width / 2.3,
            //               decoration: BoxDecoration(
            //                 color: Colors.white70,
            //                 shape: BoxShape.circle,
            //               ),
            //             ),
            //           ),
            //           Container(
            //             height: MediaQuery.of(context).size.width,
            //             width: MediaQuery.of(context).size.width,
            //             alignment: Alignment.bottomRight,
            //             child: Container(

            //               height: MediaQuery.of(context).size.width / 2.3,
            //               width: MediaQuery.of(context).size.width / 2.3,
            //               decoration: BoxDecoration(
            //                 color: Colors.white70,
            //                 shape: BoxShape.circle,
            //               ),
            //             ),
            //           ),
            //           Container(
            //             height: MediaQuery.of(context).size.width,
            //             width: MediaQuery.of(context).size.width,
            //             alignment: Alignment.bottomLeft,
            //             child: Container(

            //               height: MediaQuery.of(context).size.width / 2.3,
            //               width: MediaQuery.of(context).size.width / 2.3,
            //               decoration: BoxDecoration(
            //                 color: Colors.white70,
            //                 shape: BoxShape.circle,
            //               ),
            //             ),
            //           ),
            //           Container(
            //             height: MediaQuery.of(context).size.width,
            //             width: MediaQuery.of(context).size.width,
            //             alignment: Alignment.center,
            //             child: Padding(
            //               padding: const EdgeInsets.only(top: 20.0),
            //               child: Container(

            //                 height: MediaQuery.of(context).size.width / 2.3,
            //                 width: MediaQuery.of(context).size.width / 2.3,
            //                 decoration: BoxDecoration(
            //                   color: Colors.yellow[100],
            //                   shape: BoxShape.circle,
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //   ),
            // ),
            // )
          );
  }
}
