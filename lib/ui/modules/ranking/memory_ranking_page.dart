// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:learn_english/core/models/user.dart';
// import 'package:learn_english/ui/modules/ranking/rank_list.dart';
// import 'package:learn_english/ui/provider/account_user.dart';
// import 'package:provider/provider.dart';

// import '../../general_parameter.dart';
// import '../loading_page.dart';

// class MemoryRankingPage extends StatelessWidget {
//   int index = -1;
//   String userId;

//   @override
//   Widget build(BuildContext context) {
//     AccountUser accountUser = Provider.of<AccountUser>(context);
//     if (accountUser.user != null) userId = accountUser.user.userId;
//     return Consumer<List<User>>(builder: (context, value, child) {
//       if (value == null) return LoadingPage();
//       value.sort((a, b) => b.memoryCard.compareTo(a.memoryCard));
//       if (userId != null) {
//         for (int i = 0; i < value.length; i++) {
//           if (value[i].userId == userId) {
//             index = i;
//             break;
//           }
//         }
//       }
//       if (index == -1) return LoadingPage();
//       return Scaffold(
//         backgroundColor: Colors.white,
//         body: SafeArea(
//           child: Column(
//             children: <Widget>[
//               Container(
//                 height: 230,
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                   color: (kIsWeb) ? Colors.white : Colors.purple[200],
//                   borderRadius: (kIsWeb)
//                       ? null
//                       : BorderRadius.only(
//                           bottomLeft: Radius.circular(60),
//                           bottomRight: Radius.circular(0),
//                         ),
//                   image: (kIsWeb)
//                       ? DecorationImage(
//                           image: Image.asset('assets/bgranking2.jpg').image,
//                           fit: BoxFit.cover)
//                       : null,
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Padding(
//                       padding: EdgeInsets.only(bottom: 5),
//                       child: AutoSizeText('Memory Card Ranking',
//                           maxLines: 1,
//                           style: TextStyle(
//                               color: titleRankingColor,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 35,
//                               fontFamily: 'Arial')),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         (value[1] == null)
//                             ? Container()
//                             : Container(
//                                 height: 120,
//                                 width: 80,
//                                 decoration: BoxDecoration(
//                                   color: Colors.purple[400],
//                                   borderRadius: BorderRadius.only(
//                                       topLeft: Radius.circular(3),
//                                       bottomLeft: Radius.circular(3)),
//                                 ),
//                                 child: Column(
//                                   children: <Widget>[
//                                     Text(
//                                       'TOP 3',
//                                       style: TextStyle(
//                                           fontSize: 20,
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.white),
//                                     ),
//                                     Expanded(
//                                       child: Container(
//                                         width:
//                                             MediaQuery.of(context).size.width,
//                                         decoration: BoxDecoration(
//                                             color: Colors.white,
//                                             borderRadius: BorderRadius.only(
//                                                 bottomLeft:
//                                                     Radius.circular(3))),
//                                         child: Column(children: <Widget>[
//                                           Padding(
//                                             padding: EdgeInsets.only(top: 2),
//                                             child: Container(
//                                               height: 50,
//                                               width: 50,
//                                               decoration: BoxDecoration(
//                                                 shape: BoxShape.circle,
//                                                 color: Colors.white,
//                                                 image: DecorationImage(
//                                                     image: Image.network(
//                                                             value[2].avatarUrl)
//                                                         .image),
//                                               ),
//                                             ),
//                                           ),
//                                           Container(
//                                             height: 15,
//                                             child: AutoSizeText(
//                                               '${value[2].name}',
//                                               maxLines: 1,
//                                               textAlign: TextAlign.center,
//                                               overflow: TextOverflow.visible,
//                                             ),
//                                           ),
//                                           Container(
//                                             height: 20,
//                                             child: AutoSizeText(
//                                               'L. ${value[2].memoryCard}',
//                                               textAlign: TextAlign.center,
//                                               maxLines: 1,
//                                               style: TextStyle(
//                                                 fontSize: 16,
//                                               ),
//                                             ),
//                                           )
//                                         ]),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                         Container(
//                           height: 150,
//                           width: 120,
//                           decoration: BoxDecoration(
//                             color: Colors.blue[600],
//                             borderRadius: BorderRadius.circular(5),
//                           ),
//                           child: Column(
//                             children: <Widget>[
//                               Text(
//                                 'TOP 1',
//                                 style: TextStyle(
//                                     fontSize: 25,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white),
//                               ),
//                               Expanded(
//                                 child: Container(
//                                   width: MediaQuery.of(context).size.width,
//                                   decoration: BoxDecoration(
//                                       color: Colors.white,
//                                       borderRadius: BorderRadius.only(
//                                           bottomRight: Radius.circular(5),
//                                           bottomLeft: Radius.circular(5))),
//                                   child: Column(children: <Widget>[
//                                     Padding(
//                                       padding: EdgeInsets.only(top: 3),
//                                       child: Container(
//                                         height: 70,
//                                         width: 70,
//                                         decoration: BoxDecoration(
//                                           shape: BoxShape.circle,
//                                           color: Colors.white,
//                                           image: DecorationImage(
//                                               image: Image.network(
//                                                       value[0].avatarUrl)
//                                                   .image),
//                                         ),
//                                       ),
//                                     ),
//                                     Container(
//                                       height: 15,
//                                       child: AutoSizeText(
//                                         '${value[0].name}',
//                                         maxLines: 1,
//                                         textAlign: TextAlign.center,
//                                         overflow: TextOverflow.visible,
//                                       ),
//                                     ),
//                                     Container(
//                                       height: 20,
//                                       child: AutoSizeText(
//                                         'L. ${value[0].memoryCard}',
//                                         textAlign: TextAlign.center,
//                                         maxLines: 1,
//                                         style: TextStyle(
//                                           fontSize: 18,
//                                         ),
//                                       ),
//                                     )
//                                   ]),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                         (value[2] == null)
//                             ? Container()
//                             : Container(
//                                 height: 135,
//                                 width: 90,
//                                 decoration: BoxDecoration(
//                                     color: Colors.green[700],
//                                     borderRadius: BorderRadius.only(
//                                         topRight: Radius.circular(3),
//                                         bottomRight: Radius.circular(3))),
//                                 child: Column(
//                                   children: <Widget>[
//                                     Text(
//                                       'TOP 2',
//                                       style: TextStyle(
//                                           fontSize: 22,
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.white),
//                                     ),
//                                     Expanded(
//                                       child: Container(
//                                         width:
//                                             MediaQuery.of(context).size.width,
//                                         decoration: BoxDecoration(
//                                             color: Colors.white,
//                                             borderRadius: BorderRadius.only(
//                                                 bottomRight:
//                                                     Radius.circular(3))),
//                                         child: Column(children: <Widget>[
//                                           Padding(
//                                             padding: EdgeInsets.only(top: 2),
//                                             child: Container(
//                                               height: 60,
//                                               width: 60,
//                                               decoration: BoxDecoration(
//                                                 shape: BoxShape.circle,
//                                                 color: Colors.white,
//                                                 image: DecorationImage(
//                                                     image: Image.network(
//                                                             value[1].avatarUrl)
//                                                         .image),
//                                               ),
//                                             ),
//                                           ),
//                                           Container(
//                                             height: 15,
//                                             child: AutoSizeText(
//                                               '${value[1].name}',
//                                               maxLines: 1,
//                                               textAlign: TextAlign.center,
//                                               overflow: TextOverflow.visible,
//                                             ),
//                                           ),
//                                           Container(
//                                             height: 20,
//                                             child: AutoSizeText(
//                                               'L. ${value[1].memoryCard}',
//                                               textAlign: TextAlign.center,
//                                               maxLines: 1,
//                                               style: TextStyle(
//                                                 fontSize: 17,
//                                               ),
//                                             ),
//                                           )
//                                         ]),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//               Expanded(
//                   child: Container(
//                 color: Colors.purple[200],
//                 child: Container(
//                   height: MediaQuery.of(context).size.height,
//                   width: MediaQuery.of(context).size.width,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: (kIsWeb)
//                         ? null
//                         : BorderRadius.only(
//                             topRight: Radius.circular(40),
//                           ),
//                   ),
//                   child: RankList(
//                     value: value,
//                     typeOfCode: 3,
//                     index: index,
//                   ),
//                 ),
//               )),
//             ],
//           ),
//         ),
//       );
//     });
//   }
// }

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

class MemoryRankingPage extends StatelessWidget {
  int index = -1;
  String userId;
  @override
  Widget build(BuildContext context) {
    AccountUser accountUser = Provider.of<AccountUser>(context);
    if (accountUser.user != null) userId = accountUser.user.userId;
    return Consumer<List<User>>(builder: (context, value, child) {
      if (value == null) return LoadingPage();
      value.sort((a, b) => b.memoryCard.compareTo(a.memoryCard));

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
                  color: (kIsWeb)? Colors.white : Colors.pink[100],
                  borderRadius: (kIsWeb)
                      ? null
                      : BorderRadius.only(
                          bottomLeft: Radius.circular(60),
                          bottomRight: Radius.circular(0),
                        ),
                  image: (kIsWeb)
                      ? DecorationImage(
                          image: Image.asset('assets/bgranking2.jpg').image,
                          fit: BoxFit.cover)
                      : null,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: AutoSizeText('Memory Card Ranking',
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
                                  color: Colors.purple,
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
                                          inforMemberAtTop('L. ${value[2].memoryCard}'),
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
                            color: Colors.blue[700],
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
                                    inforMemberAtTop('L. ${value[0].memoryCard}'),
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
                                    color: Colors.teal,
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
                                          inforMemberAtTop('L. ${value[1].memoryCard}'),
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
                color: Colors.pink[100],
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
                    typeOfCode: 3,
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


