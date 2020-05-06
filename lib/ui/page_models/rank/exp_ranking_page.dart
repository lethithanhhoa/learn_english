import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/core/models/user.dart';
import 'package:learn_english/ui/page_models/rank/rank_list.dart';
import 'package:learn_english/ui/pages/loading_page.dart';
import 'package:learn_english/ui/state/account_user.dart';
import 'package:provider/provider.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ExpRankingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // AccountUser accountUser = Provider.of<AccountUser>(context);

    return Consumer<List<User>>(builder: (context, value, child) {
      if (value == null) return LoadingPage();
      value.sort((a, b) => b.exp.compareTo(a.exp));

      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                height: 220,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.green[200],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(0),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Text('Exp Ranking',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                              fontFamily: 'Arial')),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        (value[1] == null)
                            ? Container()
                            : Container(
                                height: 120,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Colors.green[800],
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(3),
                                      bottomLeft: Radius.circular(3)),
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      'TOP 3',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(3))),
                                        child: Column(children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.only(top: 2),
                                            child: Container(
                                              height: 50,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white,
                                                image: DecorationImage(
                                                    image: Image.network(
                                                            value[2].avatarUrl)
                                                        .image),
                                              ),
                                            ),
                                          ),
                                          AutoSizeText(
                                            '${value[2].name}',
                                            maxLines: 1,
                                            overflow: TextOverflow.fade,
                                          ),
                                          AutoSizeText(
                                            '${value[2].exp}',
                                            maxLines: 1,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          )
                                        ]),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                        Container(
                          height: 150,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            children: <Widget>[
                              Text(
                                'TOP 1',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Expanded(
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(5),
                                          bottomLeft: Radius.circular(5))),
                                  child: Column(children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(top: 3),
                                      child: Container(
                                        height: 70,
                                        width: 70,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                          image: DecorationImage(
                                              image: Image.network(
                                                      value[0].avatarUrl)
                                                  .image),
                                        ),
                                      ),
                                    ),
                                    AutoSizeText(
                                      '${value[0].name}',
                                      maxLines: 1,
                                      overflow: TextOverflow.fade,
                                    ),
                                    AutoSizeText(
                                      '${value[0].exp}',
                                      maxLines: 1,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    )
                                  ]),
                                ),
                              )
                            ],
                          ),
                        ),
                        (value[2] == null)
                            ? Container()
                            : Container(
                                height: 135,
                                width: 90,
                                decoration: BoxDecoration(
                                    color: Colors.blue[600],
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(3),
                                        bottomRight: Radius.circular(3))),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      'TOP 2',
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(3))),
                                        child: Column(children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.only(top: 2),
                                            child: Container(
                                              height: 60,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white,
                                                image: DecorationImage(
                                                    image: Image.network(
                                                            value[1].avatarUrl)
                                                        .image),
                                              ),
                                            ),
                                          ),
                                          AutoSizeText(
                                            '${value[1].name}',
                                            maxLines: 1,
                                            overflow: TextOverflow.fade,
                                          ),
                                          AutoSizeText(
                                            '${value[1].exp}',
                                            maxLines: 1,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 17,
                                            ),
                                          )
                                        ]),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                color: Colors.green[200],
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: RankList(
                    value: value,
                    typeOfCode: 0,
                  ),
                ),
              )),
            ],
          ),
        ),
      );
    });
  }
}
