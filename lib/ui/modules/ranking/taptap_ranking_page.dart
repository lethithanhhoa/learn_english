import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/core/models/user.dart';
import 'package:learn_english/ui/common/side_menu_bar.dart';
import 'package:learn_english/ui/modules/ranking/rank_list.dart';
import 'package:learn_english/ui/provider/account_user.dart';
import 'package:provider/provider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../../general_parameter.dart';
import '../loading_page.dart';

class TapTapRankingPage extends StatelessWidget {
  int index = -1;
  String userId;
  @override
  Widget build(BuildContext context) {
    AccountUser accountUser = Provider.of<AccountUser>(context);
    if (accountUser.user != null) userId = accountUser.user.userId;
    return Consumer<List<User>>(builder: (context, value, child) {
      if (value == null) return LoadingPage();
      value.sort((a, b) => b.taptap.compareTo(a.taptap));

      if (userId != null) {
        for (int i = 0; i < value.length; i++) {
          if (value[i].userId == userId) {
            index = i;
            break;
          }
        }
      }
      if (index == -1) return LoadingPage();
      return Scaffold(
        drawer: kIsWeb ? NavigateDrawer() : null,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                height: 230,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: (kIsWeb)? Colors.white : Colors.orange[200].withOpacity(0.8),
                  borderRadius: (kIsWeb)
                      ? null
                      : BorderRadius.only(
                          bottomLeft: Radius.circular(60),
                          bottomRight: Radius.circular(0),
                        ),
                  image: (kIsWeb)
                      ? DecorationImage(
                          image: Image.asset('assets/bgranking1.jpg').image,
                          fit: BoxFit.cover)
                      : null,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: AutoSizeText('Tap Tap Ranking',
                          maxLines: 1,
                          style: TextStyle(
                              color: titleRankingColor,
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
                                  color: Colors.blue[700],
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(3),
                                      bottomLeft: Radius.circular(3)),
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      height: 28,
                                      child: Center(
                                        child: textAtTop('TOP 3', 20),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            color: Colors.grey[50],
                                            borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(3))),
                                        child: Column(children: <Widget>[
                                          Padding(
                                              padding: EdgeInsets.only(top: 2),
                                              child: avatarAtTop(
                                                  '${value[2].avatarUrl}', 50)),
                                          inforMemberAtTop('${value[2].name}'),
                                          inforMemberAtTop('${value[2].taptap}'),
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
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 36,
                                child: Center(
                                  child: textAtTop('TOP 1', 25),
                                ),
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
                                      child: avatarAtTop(
                                          '${value[0].avatarUrl}', 68),
                                    ),
                                    inforMemberAtTop('${value[0].name}'),
                                    inforMemberAtTop('${value[0].taptap}'),
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
                                    color: Colors.purple[600],
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(3),
                                        bottomRight: Radius.circular(3))),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      height: 33,
                                      child: textAtTop('TOP 2', 22),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            color: Colors.grey[50],
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(3))),
                                        child: Column(children: <Widget>[
                                          Padding(
                                              padding: EdgeInsets.only(top: 3),
                                              child: avatarAtTop(
                                                  '${value[1].avatarUrl}', 57)),
                                          inforMemberAtTop('${value[1].name}'),
                                          inforMemberAtTop('${value[1].taptap}'),
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
                color: Colors.orange[200].withOpacity(0.8),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: (kIsWeb)
                        ? null
                        : BorderRadius.only(
                            topRight: Radius.circular(40),
                          ),
                  ),
                  child: RankList(
                    value: value,
                    typeOfCode: 2,
                    index: index,
                  ),
                ),
              )),
            ],
          ),
        ),
      );
    });
  }

  Widget textAtTop(String text, double fontSize) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.white),
      ),
    );
  }

  Widget inforMemberAtTop(String value) {
    return Container(
      height: 20,
      child: AutoSizeText(
        value,
        maxLines: 1,
        textAlign: TextAlign.center,
        overflow: TextOverflow.visible,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }

  Widget avatarAtTop(String imageUrl, double size) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(80.0),
        child: FadeInImage.assetNetwork(
          fit: BoxFit.cover,
          width: size,
          height: size,
          placeholder: "assets/avatar.png",
          image: imageUrl,
        ),
      ),
    );
  }
}

