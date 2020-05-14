// import 'dart:math';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:learn_english/core/models/vocabulary.dart';
// import 'package:learn_english/core/services/user_service.dart';
// import 'package:learn_english/ui/modules/audio_player.dart';
// import 'package:learn_english/ui/state/account_user.dart';
// import 'package:learn_english/ui/state/matrix_4by4_state.dart';
// import 'package:provider/provider.dart';

// class Matrix4By4Page extends StatelessWidget {
//   List<Vocabulary> vocabList;
//   Matrix4By4Page({this.vocabList});
//   UserService userService = UserService();
//   AudioPlayer audioPlayer = AudioPlayer();
//   List<Cell> widgets;

//   Future<bool> onWillPop() {
//     Fluttertoast.showToast(msg: "Press close icon to back");
//     return Future.value(false);
//   }

//   Future<bool> onWillPopAlertMessage() {
//     return Future.value(false);
//   }

//   @override
//   Widget build(BuildContext context) {
//     AccountUser accountUser = Provider.of<AccountUser>(context);
//     Matrix4By4State matrix4by4state = Provider.of<Matrix4By4State>(context);

//     matrix4by4state.load();

//     if (matrix4by4state.getCheckIsWrong) {
//       int currentExp = accountUser.exp;
//       if (currentExp >= 100)
//         return WillPopScope(
//           onWillPop: onWillPopAlertMessage,
//           child: AlertDialog(
//             title: Text(
//               'SCORE: ${matrix4by4state.getScore}',
//               style: TextStyle(color: Colors.green, fontSize: 25),
//             ),
//             content: RichText(
//               text: TextSpan(
//                   style: GoogleFonts.handlee(
//                       textStyle: TextStyle(color: Colors.blue, fontSize: 18)),
//                   children: <TextSpan>[
//                     TextSpan(text: 'Do you want to trade '),
//                     TextSpan(
//                       text: '${100} ',
//                       style: TextStyle(color: Colors.orange[300], fontSize: 25),
//                     ),
//                     TextSpan(
//                       text: 'EXP ',
//                       style: TextStyle(color: Colors.green[300], fontSize: 25),
//                     ),
//                     TextSpan(text: 'to continue?'),
//                   ]),
//             ),
//             actions: <Widget>[
//               FlatButton(
//                 child: Text('Yes'),
//                 onPressed: () {
//                   int updateExp = currentExp - 100;
//                   userService.updateExp(accountUser.user.userId, updateExp);
//                   accountUser.decrementExp(100);

//                   matrix4by4state.fetch();
//                 },
//               ),
//               FlatButton(
//                 child: Text('No'),
//                 onPressed: () {
//                   if (matrix4by4state.getScore > 0) {
//                     int currentHighScore = accountUser.user.matrix4by4;
//                     if (currentHighScore < matrix4by4state.getScore) {
//                       userService.updateMatrix4by4HighScore(
//                           accountUser.user.userId, matrix4by4state.getScore);
//                     }
//                   }
//                   Navigator.of(context).pop();
//                 },
//               )
//             ],
//           ),
//         );

//       return WillPopScope(
//         onWillPop: onWillPopAlertMessage,
//         child: AlertDialog(
//           title: Text(
//             'You are wrong!!!',
//             style: TextStyle(color: Colors.red[400], fontSize: 25),
//           ),
//           content: RichText(
//             text: TextSpan(
//                 style: GoogleFonts.handlee(
//                     textStyle: TextStyle(color: Colors.blue, fontSize: 18)),
//                 children: <TextSpan>[
//                   TextSpan(text: 'Your score: '),
//                   TextSpan(
//                     text: '${matrix4by4state.getScore} ',
//                     style: TextStyle(color: Colors.green[300], fontSize: 25),
//                   ),
//                 ]),
//           ),
//           actions: <Widget>[
//             FlatButton(
//               child: Text('OK'),
//               onPressed: () {
//                 if (matrix4by4state.getScore > 0) {
//                   int currentHighScore = accountUser.user.matrix4by4;
//                   if (currentHighScore < matrix4by4state.getScore) {
//                     userService.updateMatrix4by4HighScore(
//                         accountUser.user.userId, matrix4by4state.getScore);
//                   }
//                 }

//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         ),
//       );
//     }

//     if (matrix4by4state.getLoading) {
//       Random random = Random();
//       matrix4by4state.setFirstIndex(random.nextInt(vocabList.length));
//       do {
//         matrix4by4state.setSecondIndex(random.nextInt(vocabList.length));
//       } while (matrix4by4state.secondIndex == matrix4by4state.firstIndex);

//       do {
//         matrix4by4state.setThirdIndex(random.nextInt(vocabList.length));
//       } while (matrix4by4state.secondIndex == matrix4by4state.thirdIndex ||
//           matrix4by4state.firstIndex == matrix4by4state.thirdIndex);

//       do {
//         matrix4by4state.setForIndex(random.nextInt(vocabList.length));
//       } while (matrix4by4state.thirdIndex == matrix4by4state.forIndex ||
//           matrix4by4state.secondIndex == matrix4by4state.forIndex ||
//           matrix4by4state.firstIndex == matrix4by4state.forIndex);

//       do {
//         matrix4by4state.setFiveIndex(random.nextInt(vocabList.length));
//       } while (matrix4by4state.forIndex == matrix4by4state.fiveIndex ||
//           matrix4by4state.thirdIndex == matrix4by4state.fiveIndex ||
//           matrix4by4state.secondIndex == matrix4by4state.fiveIndex ||
//           matrix4by4state.firstIndex == matrix4by4state.fiveIndex);
//       do {
//         matrix4by4state.setSixIndex(random.nextInt(vocabList.length));
//       } while (matrix4by4state.fiveIndex == matrix4by4state.sixIndex ||
//           matrix4by4state.forIndex == matrix4by4state.sixIndex ||
//           matrix4by4state.thirdIndex == matrix4by4state.sixIndex ||
//           matrix4by4state.secondIndex == matrix4by4state.sixIndex ||
//           matrix4by4state.firstIndex == matrix4by4state.sixIndex);
//       do {
//         matrix4by4state.setSevenIndex(random.nextInt(vocabList.length));
//       } while (matrix4by4state.sixIndex == matrix4by4state.sevenIndex ||
//           matrix4by4state.fiveIndex == matrix4by4state.sevenIndex ||
//           matrix4by4state.forIndex == matrix4by4state.sevenIndex ||
//           matrix4by4state.thirdIndex == matrix4by4state.sevenIndex ||
//           matrix4by4state.secondIndex == matrix4by4state.sevenIndex ||
//           matrix4by4state.firstIndex == matrix4by4state.sevenIndex);
//       do {
//         matrix4by4state.setEightIndex(random.nextInt(vocabList.length));
//       } while (matrix4by4state.sevenIndex == matrix4by4state.eightIndex ||
//           matrix4by4state.sixIndex == matrix4by4state.eightIndex ||
//           matrix4by4state.fiveIndex == matrix4by4state.eightIndex ||
//           matrix4by4state.forIndex == matrix4by4state.eightIndex ||
//           matrix4by4state.thirdIndex == matrix4by4state.eightIndex ||
//           matrix4by4state.secondIndex == matrix4by4state.eightIndex ||
//           matrix4by4state.firstIndex == matrix4by4state.eightIndex);

//       widgets = [
//         ImageCell(
//           vocabulary: vocabList[matrix4by4state.firstIndex],
//           textSize: 14,
//           borderRadius: 8,
//         ),
//         TextCell(
//           vocabulary: vocabList[matrix4by4state.firstIndex],
//           textSize: 25,
//           borderRadius: 8,
//         ),
//         ImageCell(
//           vocabulary: vocabList[matrix4by4state.secondIndex],
//           textSize: 14,
//           borderRadius: 8,
//         ),
//         TextCell(
//           vocabulary: vocabList[matrix4by4state.secondIndex],
//           textSize: 25,
//           borderRadius: 8,
//         ),
//         ImageCell(
//           vocabulary: vocabList[matrix4by4state.thirdIndex],
//           textSize: 14,
//           borderRadius: 8,
//         ),
//         TextCell(
//           vocabulary: vocabList[matrix4by4state.thirdIndex],
//           textSize: 25,
//           borderRadius: 8,
//         ),
//         ImageCell(
//           vocabulary: vocabList[matrix4by4state.forIndex],
//           textSize: 14,
//           borderRadius: 8,
//         ),
//         TextCell(
//           vocabulary: vocabList[matrix4by4state.forIndex],
//           textSize: 25,
//           borderRadius: 8,
//         ),
//         ImageCell(
//           vocabulary: vocabList[matrix4by4state.fiveIndex],
//           textSize: 14,
//           borderRadius: 8,
//         ),
//         TextCell(
//           vocabulary: vocabList[matrix4by4state.fiveIndex],
//           textSize: 25,
//           borderRadius: 8,
//         ),
//         ImageCell(
//           vocabulary: vocabList[matrix4by4state.sixIndex],
//           textSize: 14,
//           borderRadius: 8,
//         ),
//         TextCell(
//           vocabulary: vocabList[matrix4by4state.sixIndex],
//           textSize: 25,
//           borderRadius: 8,
//         ),
//         ImageCell(
//           vocabulary: vocabList[matrix4by4state.sevenIndex],
//           textSize: 14,
//           borderRadius: 8,
//         ),
//         TextCell(
//           vocabulary: vocabList[matrix4by4state.sevenIndex],
//           textSize: 25,
//           borderRadius: 8,
//         ),
//         ImageCell(
//           vocabulary: vocabList[matrix4by4state.eightIndex],
//           textSize: 14,
//           borderRadius: 8,
//         ),
//         TextCell(
//           vocabulary: vocabList[matrix4by4state.eightIndex],
//           textSize: 25,
//           borderRadius: 8,
//         ),
//       ];
//       widgets.shuffle();

//       matrix4by4state.setLoading(false);
//     }

//     return Scaffold(
//       backgroundColor: Colors.purple[100],
//       body: WillPopScope(
//         onWillPop: onWillPop,
//         child: SafeArea(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 10),
//             child: Stack(
//               children: <Widget>[
//                 Container(
//                   height: MediaQuery.of(context).size.width - 20,
//                   width: MediaQuery.of(context).size.width,
//                   alignment: Alignment.topRight,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       IconButton(
//                           icon: Container(
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: Colors.white,
//                               ),
//                               child: Icon(
//                                 Icons.close,
//                                 color: Colors.grey,
//                               )),
//                           onPressed: () {
//                             if (matrix4by4state.getScore > 0) {
//                               int currentHighScore =
//                                   accountUser.user.matrix4by4;
//                               if (currentHighScore < matrix4by4state.getScore) {
//                                 userService.updateMatrix4by4HighScore(
//                                     accountUser.user.userId,
//                                     matrix4by4state.getScore);
//                               }
//                             }
//                             Navigator.of(context).pop();
//                           }),
//                       Text(
//                         'SCORE: ${matrix4by4state.getScore}',
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 25,
//                             fontWeight: FontWeight.w500),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: MediaQuery.of(context).size.height,
//                   alignment: Alignment.center,
//                   child: Container(
//                     width: MediaQuery.of(context).size.width,
//                     height: MediaQuery.of(context).size.width - 20,
//                     child: Column(
//                       children: <Widget>[
//                         Expanded(
//                           child: Row(
//                             children: <Widget>[
//                               Expanded(
//                                 child: GestureDetector(
//                                   onTap: (matrix4by4state
//                                               .getResultOfFirstWidget ==
//                                           0)
//                                       ? () {
//                                           audioPlayer.playDragSound();
//                                           matrix4by4state.setFirstWidgetState(
//                                               widgets[0].vocabulary.vocab);
//                                         }
//                                       : null,
//                                   child: (matrix4by4state
//                                               .getResultOfFirstWidget ==
//                                           1)
//                                       ? Container()
//                                       : Transform.scale(
//                                           scale: matrix4by4state
//                                                   .getFirstWidgetState
//                                               ? 1.05
//                                               : 1.0,
//                                           child: Padding(
//                                             padding: EdgeInsets.all(2.5),
//                                             child: Stack(
//                                               children: <Widget>[
//                                                 widgets[0],
//                                                 Container(
//                                                   height: MediaQuery.of(context)
//                                                       .size
//                                                       .height,
//                                                   width: MediaQuery.of(context)
//                                                       .size
//                                                       .width,
//                                                   decoration: BoxDecoration(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             8.0),
//                                                     color: matrix4by4state
//                                                             .getFirstWidgetState
//                                                         ? Colors.yellow
//                                                             .withOpacity(0.3)
//                                                         : Colors.white
//                                                             .withOpacity(0),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           )),
//                                 ),
//                               ),
//                               Expanded(
//                                 child: GestureDetector(
//                                   onTap: (matrix4by4state
//                                               .getResultOfSecondWidget ==
//                                           0)
//                                       ? () {
//                                           audioPlayer.playDragSound();
//                                           matrix4by4state.setSecondWidgetState(
//                                               widgets[1].vocabulary.vocab);
//                                         }
//                                       : null,
//                                   child: (matrix4by4state
//                                               .getResultOfSecondWidget ==
//                                           1)
//                                       ? Container()
//                                       : Transform.scale(
//                                           scale: matrix4by4state
//                                                   .getSecondWidgetState
//                                               ? 1.05
//                                               : 1.0,
//                                           child: Padding(
//                                             padding: EdgeInsets.all(2.5),
//                                             child: Stack(
//                                               children: <Widget>[
//                                                 widgets[1],
//                                                 Container(
//                                                   height: MediaQuery.of(context)
//                                                       .size
//                                                       .height,
//                                                   width: MediaQuery.of(context)
//                                                       .size
//                                                       .width,
//                                                   decoration: BoxDecoration(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             8.0),
//                                                     color: matrix4by4state
//                                                             .getSecondWidgetState
//                                                         ? Colors.yellow
//                                                             .withOpacity(0.3)
//                                                         : Colors.white
//                                                             .withOpacity(0),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           )),
//                                 ),
//                               ),
//                               Expanded(
//                                 child: GestureDetector(
//                                   onTap: (matrix4by4state
//                                               .getResultOfThirdWidget ==
//                                           0)
//                                       ? () {
//                                           audioPlayer.playDragSound();
//                                           matrix4by4state.setThirdWidgetState(
//                                               widgets[2].vocabulary.vocab);
//                                         }
//                                       : null,
//                                   child: (matrix4by4state
//                                               .getResultOfThirdWidget ==
//                                           1)
//                                       ? Container()
//                                       : Transform.scale(
//                                           scale: matrix4by4state
//                                                   .getThirdWidgetState
//                                               ? 1.05
//                                               : 1.0,
//                                           child: Padding(
//                                             padding: EdgeInsets.all(2.5),
//                                             child: Stack(
//                                               children: <Widget>[
//                                                 widgets[2],
//                                                 Container(
//                                                   height: MediaQuery.of(context)
//                                                       .size
//                                                       .height,
//                                                   width: MediaQuery.of(context)
//                                                       .size
//                                                       .width,
//                                                   decoration: BoxDecoration(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             8.0),
//                                                     color: matrix4by4state
//                                                             .getThirdWidgetState
//                                                         ? Colors.yellow
//                                                             .withOpacity(0.3)
//                                                         : Colors.white
//                                                             .withOpacity(0),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           )),
//                                 ),
//                               ),
//                               Expanded(
//                                 child: GestureDetector(
//                                   onTap:
//                                       (matrix4by4state.getResultOfForWidget ==
//                                               0)
//                                           ? () {
//                                               audioPlayer.playDragSound();
//                                               matrix4by4state.setForWidgetState(
//                                                   widgets[3].vocabulary.vocab);
//                                             }
//                                           : null,
//                                   child: (matrix4by4state
//                                               .getResultOfForWidget ==
//                                           1)
//                                       ? Container()
//                                       : Transform.scale(
//                                           scale:
//                                               matrix4by4state.getForWidgetState
//                                                   ? 1.05
//                                                   : 1.0,
//                                           child: Padding(
//                                             padding: EdgeInsets.all(2.5),
//                                             child: Stack(
//                                               children: <Widget>[
//                                                 widgets[3],
//                                                 Container(
//                                                   height: MediaQuery.of(context)
//                                                       .size
//                                                       .height,
//                                                   width: MediaQuery.of(context)
//                                                       .size
//                                                       .width,
//                                                   decoration: BoxDecoration(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             8.0),
//                                                     color: matrix4by4state
//                                                             .getForWidgetState
//                                                         ? Colors.yellow
//                                                             .withOpacity(0.3)
//                                                         : Colors.white
//                                                             .withOpacity(0),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           )),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Expanded(
//                           child: Row(
//                             children: <Widget>[
//                               Expanded(
//                                 child: GestureDetector(
//                                   onTap: (matrix4by4state
//                                               .getResultOfFiveWidget ==
//                                           0)
//                                       ? () {
//                                           audioPlayer.playDragSound();
//                                           matrix4by4state.setFiveWidgetState(
//                                               widgets[4].vocabulary.vocab);
//                                         }
//                                       : null,
//                                   child: (matrix4by4state
//                                               .getResultOfFiveWidget ==
//                                           1)
//                                       ? Container()
//                                       : Transform.scale(
//                                           scale:
//                                               matrix4by4state.getFiveWidgetState
//                                                   ? 1.05
//                                                   : 1.0,
//                                           child: Padding(
//                                             padding: EdgeInsets.all(2.5),
//                                             child: Stack(
//                                               children: <Widget>[
//                                                 widgets[4],
//                                                 Container(
//                                                   height: MediaQuery.of(context)
//                                                       .size
//                                                       .height,
//                                                   width: MediaQuery.of(context)
//                                                       .size
//                                                       .width,
//                                                   decoration: BoxDecoration(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             8.0),
//                                                     color: matrix4by4state
//                                                             .getFiveWidgetState
//                                                         ? Colors.yellow
//                                                             .withOpacity(0.3)
//                                                         : Colors.white
//                                                             .withOpacity(0),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           )),
//                                 ),
//                               ),
//                               Expanded(
//                                 child: GestureDetector(
//                                   onTap:
//                                       (matrix4by4state.getResultOfSixWidget ==
//                                               0)
//                                           ? () {
//                                               audioPlayer.playDragSound();
//                                               matrix4by4state.setSixWidgetState(
//                                                   widgets[5].vocabulary.vocab);
//                                             }
//                                           : null,
//                                   child: (matrix4by4state
//                                               .getResultOfSixWidget ==
//                                           1)
//                                       ? Container()
//                                       : Transform.scale(
//                                           scale:
//                                               matrix4by4state.getSixWidgetState
//                                                   ? 1.05
//                                                   : 1.0,
//                                           child: Padding(
//                                             padding: EdgeInsets.all(2.5),
//                                             child: Stack(
//                                               children: <Widget>[
//                                                 widgets[5],
//                                                 Container(
//                                                   height: MediaQuery.of(context)
//                                                       .size
//                                                       .height,
//                                                   width: MediaQuery.of(context)
//                                                       .size
//                                                       .width,
//                                                   decoration: BoxDecoration(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             8.0),
//                                                     color: matrix4by4state
//                                                             .getSixWidgetState
//                                                         ? Colors.yellow
//                                                             .withOpacity(0.3)
//                                                         : Colors.white
//                                                             .withOpacity(0),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           )),
//                                 ),
//                               ),
//                               Expanded(
//                                 child: GestureDetector(
//                                   onTap: (matrix4by4state
//                                               .getResultOfSevenWidget ==
//                                           0)
//                                       ? () {
//                                           audioPlayer.playDragSound();
//                                           matrix4by4state.setSevenWidgetState(
//                                               widgets[6].vocabulary.vocab);
//                                         }
//                                       : null,
//                                   child: (matrix4by4state
//                                               .getResultOfSevenWidget ==
//                                           1)
//                                       ? Container()
//                                       : Transform.scale(
//                                           scale: matrix4by4state
//                                                   .getSevenWidgetState
//                                               ? 1.05
//                                               : 1.0,
//                                           child: Padding(
//                                             padding: EdgeInsets.all(2.5),
//                                             child: Stack(
//                                               children: <Widget>[
//                                                 widgets[6],
//                                                 Container(
//                                                   height: MediaQuery.of(context)
//                                                       .size
//                                                       .height,
//                                                   width: MediaQuery.of(context)
//                                                       .size
//                                                       .width,
//                                                   decoration: BoxDecoration(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             8.0),
//                                                     color: matrix4by4state
//                                                             .getSevenWidgetState
//                                                         ? Colors.yellow
//                                                             .withOpacity(0.3)
//                                                         : Colors.white
//                                                             .withOpacity(0),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           )),
//                                 ),
//                               ),
//                               Expanded(
//                                 child: GestureDetector(
//                                   onTap: (matrix4by4state
//                                               .getResultOfEightWidget ==
//                                           0)
//                                       ? () {
//                                           audioPlayer.playDragSound();
//                                           matrix4by4state.setEightWidgetState(
//                                               widgets[7].vocabulary.vocab);
//                                         }
//                                       : null,
//                                   child: (matrix4by4state
//                                               .getResultOfEightWidget ==
//                                           1)
//                                       ? Container()
//                                       : Transform.scale(
//                                           scale: matrix4by4state
//                                                   .getEightWidgetState
//                                               ? 1.05
//                                               : 1.0,
//                                           child: Padding(
//                                             padding: EdgeInsets.all(2.5),
//                                             child: Stack(
//                                               children: <Widget>[
//                                                 widgets[7],
//                                                 Container(
//                                                   height: MediaQuery.of(context)
//                                                       .size
//                                                       .height,
//                                                   width: MediaQuery.of(context)
//                                                       .size
//                                                       .width,
//                                                   decoration: BoxDecoration(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             8.0),
//                                                     color: matrix4by4state
//                                                             .getEightWidgetState
//                                                         ? Colors.yellow
//                                                             .withOpacity(0.3)
//                                                         : Colors.white
//                                                             .withOpacity(0),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           )),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Expanded(
//                           child: Row(
//                             children: <Widget>[
//                               Expanded(
//                                 child: GestureDetector(
//                                   onTap: (matrix4by4state
//                                               .getResultOfNineWidget ==
//                                           0)
//                                       ? () {
//                                           audioPlayer.playDragSound();
//                                           matrix4by4state.setNineWidgetState(
//                                               widgets[8].vocabulary.vocab);
//                                         }
//                                       : null,
//                                   child: (matrix4by4state
//                                               .getResultOfNineWidget ==
//                                           1)
//                                       ? Container()
//                                       : Transform.scale(
//                                           scale:
//                                               matrix4by4state.getNineWidgetState
//                                                   ? 1.05
//                                                   : 1.0,
//                                           child: Padding(
//                                             padding: EdgeInsets.all(2.5),
//                                             child: Stack(
//                                               children: <Widget>[
//                                                 widgets[8],
//                                                 Container(
//                                                   height: MediaQuery.of(context)
//                                                       .size
//                                                       .height,
//                                                   width: MediaQuery.of(context)
//                                                       .size
//                                                       .width,
//                                                   decoration: BoxDecoration(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             8.0),
//                                                     color: matrix4by4state
//                                                             .getNineWidgetState
//                                                         ? Colors.yellow
//                                                             .withOpacity(0.3)
//                                                         : Colors.white
//                                                             .withOpacity(0),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           )),
//                                 ),
//                               ),
//                               Expanded(
//                                 child: GestureDetector(
//                                   onTap:
//                                       (matrix4by4state.getResultOfTenWidget ==
//                                               0)
//                                           ? () {
//                                               audioPlayer.playDragSound();
//                                               matrix4by4state.setTenWidgetState(
//                                                   widgets[9].vocabulary.vocab);
//                                             }
//                                           : null,
//                                   child: (matrix4by4state
//                                               .getResultOfTenWidget ==
//                                           1)
//                                       ? Container()
//                                       : Transform.scale(
//                                           scale:
//                                               matrix4by4state.getTenWidgetState
//                                                   ? 1.05
//                                                   : 1.0,
//                                           child: Padding(
//                                             padding: EdgeInsets.all(2.5),
//                                             child: Stack(
//                                               children: <Widget>[
//                                                 widgets[9],
//                                                 Container(
//                                                   height: MediaQuery.of(context)
//                                                       .size
//                                                       .height,
//                                                   width: MediaQuery.of(context)
//                                                       .size
//                                                       .width,
//                                                   decoration: BoxDecoration(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             8.0),
//                                                     color: matrix4by4state
//                                                             .getTenWidgetState
//                                                         ? Colors.yellow
//                                                             .withOpacity(0.3)
//                                                         : Colors.white
//                                                             .withOpacity(0),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           )),
//                                 ),
//                               ),
//                               Expanded(
//                                 child: GestureDetector(
//                                   onTap: (matrix4by4state
//                                               .getResultOfElevenWidget ==
//                                           0)
//                                       ? () {
//                                           audioPlayer.playDragSound();
//                                           matrix4by4state.setElevenWidgetState(
//                                               widgets[10].vocabulary.vocab);
//                                         }
//                                       : null,
//                                   child: (matrix4by4state
//                                               .getResultOfElevenWidget ==
//                                           1)
//                                       ? Container()
//                                       : Transform.scale(
//                                           scale: matrix4by4state
//                                                   .getElevenWidgetState
//                                               ? 1.05
//                                               : 1.0,
//                                           child: Padding(
//                                             padding: EdgeInsets.all(2.5),
//                                             child: Stack(
//                                               children: <Widget>[
//                                                 widgets[10],
//                                                 Container(
//                                                   height: MediaQuery.of(context)
//                                                       .size
//                                                       .height,
//                                                   width: MediaQuery.of(context)
//                                                       .size
//                                                       .width,
//                                                   decoration: BoxDecoration(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             8.0),
//                                                     color: matrix4by4state
//                                                             .getElevenWidgetState
//                                                         ? Colors.yellow
//                                                             .withOpacity(0.3)
//                                                         : Colors.white
//                                                             .withOpacity(0),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           )),
//                                 ),
//                               ),
//                               Expanded(
//                                 child: GestureDetector(
//                                   onTap: (matrix4by4state
//                                               .getResultOfTwelveWidget ==
//                                           0)
//                                       ? () {
//                                           audioPlayer.playDragSound();
//                                           matrix4by4state.setTwelveWidgetState(
//                                               widgets[11].vocabulary.vocab);
//                                         }
//                                       : null,
//                                   child: (matrix4by4state
//                                               .getResultOfTwelveWidget ==
//                                           1)
//                                       ? Container()
//                                       : Transform.scale(
//                                           scale: matrix4by4state
//                                                   .getTwelveWidgetState
//                                               ? 1.05
//                                               : 1.0,
//                                           child: Padding(
//                                             padding: EdgeInsets.all(2.5),
//                                             child: Stack(
//                                               children: <Widget>[
//                                                 widgets[11],
//                                                 Container(
//                                                   height: MediaQuery.of(context)
//                                                       .size
//                                                       .height,
//                                                   width: MediaQuery.of(context)
//                                                       .size
//                                                       .width,
//                                                   decoration: BoxDecoration(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             8.0),
//                                                     color: matrix4by4state
//                                                             .getTwelveWidgetState
//                                                         ? Colors.yellow
//                                                             .withOpacity(0.3)
//                                                         : Colors.white
//                                                             .withOpacity(0),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           )),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Expanded(
//                           child: Row(
//                             children: <Widget>[
//                               Expanded(
//                                 child: GestureDetector(
//                                   onTap: (matrix4by4state
//                                               .getResultOfThirteenWidget ==
//                                           0)
//                                       ? () {
//                                           audioPlayer.playDragSound();
//                                           matrix4by4state
//                                               .setThirteenWidgetState(
//                                                   widgets[12].vocabulary.vocab);
//                                         }
//                                       : null,
//                                   child: (matrix4by4state
//                                               .getResultOfThirteenWidget ==
//                                           1)
//                                       ? Container()
//                                       : Transform.scale(
//                                           scale: matrix4by4state
//                                                   .getThirteenWidgetState
//                                               ? 1.05
//                                               : 1.0,
//                                           child: Padding(
//                                             padding: EdgeInsets.all(2.5),
//                                             child: Stack(
//                                               children: <Widget>[
//                                                 widgets[12],
//                                                 Container(
//                                                   height: MediaQuery.of(context)
//                                                       .size
//                                                       .height,
//                                                   width: MediaQuery.of(context)
//                                                       .size
//                                                       .width,
//                                                   decoration: BoxDecoration(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             8.0),
//                                                     color: matrix4by4state
//                                                             .getThirteenWidgetState
//                                                         ? Colors.yellow
//                                                             .withOpacity(0.3)
//                                                         : Colors.white
//                                                             .withOpacity(0),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           )),
//                                 ),
//                               ),
//                               Expanded(
//                                 child: GestureDetector(
//                                   onTap: (matrix4by4state
//                                               .getResultOfForteenWidget ==
//                                           0)
//                                       ? () {
//                                           audioPlayer.playDragSound();
//                                           matrix4by4state.setForteenWidgetState(
//                                               widgets[13].vocabulary.vocab);
//                                         }
//                                       : null,
//                                   child: (matrix4by4state
//                                               .getResultOfForteenWidget ==
//                                           1)
//                                       ? Container()
//                                       : Transform.scale(
//                                           scale: matrix4by4state
//                                                   .getForteenWidgetState
//                                               ? 1.05
//                                               : 1.0,
//                                           child: Padding(
//                                             padding: EdgeInsets.all(2.5),
//                                             child: Stack(
//                                               children: <Widget>[
//                                                 widgets[13],
//                                                 Container(
//                                                   height: MediaQuery.of(context)
//                                                       .size
//                                                       .height,
//                                                   width: MediaQuery.of(context)
//                                                       .size
//                                                       .width,
//                                                   decoration: BoxDecoration(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             8.0),
//                                                     color: matrix4by4state
//                                                             .getForteenWidgetState
//                                                         ? Colors.yellow
//                                                             .withOpacity(0.3)
//                                                         : Colors.white
//                                                             .withOpacity(0),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           )),
//                                 ),
//                               ),
//                               Expanded(
//                                 child: GestureDetector(
//                                   onTap: (matrix4by4state
//                                               .getResultOfFifteenWidget ==
//                                           0)
//                                       ? () {
//                                           audioPlayer.playDragSound();
//                                           matrix4by4state.setFifteenWidgetState(
//                                               widgets[14].vocabulary.vocab);
//                                         }
//                                       : null,
//                                   child: (matrix4by4state
//                                               .getResultOfFifteenWidget ==
//                                           1)
//                                       ? Container()
//                                       : Transform.scale(
//                                           scale: matrix4by4state
//                                                   .getFifteenWidgetState
//                                               ? 1.05
//                                               : 1.0,
//                                           child: Padding(
//                                             padding: EdgeInsets.all(2.5),
//                                             child: Stack(
//                                               children: <Widget>[
//                                                 widgets[14],
//                                                 Container(
//                                                   height: MediaQuery.of(context)
//                                                       .size
//                                                       .height,
//                                                   width: MediaQuery.of(context)
//                                                       .size
//                                                       .width,
//                                                   decoration: BoxDecoration(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             8.0),
//                                                     color: matrix4by4state
//                                                             .getFifteenWidgetState
//                                                         ? Colors.yellow
//                                                             .withOpacity(0.3)
//                                                         : Colors.white
//                                                             .withOpacity(0),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           )),
//                                 ),
//                               ),
//                               Expanded(
//                                 child: GestureDetector(
//                                   onTap: (matrix4by4state
//                                               .getResultOfSixteenWidget ==
//                                           0)
//                                       ? () {
//                                           audioPlayer.playDragSound();
//                                           matrix4by4state.setSixteenWidgetState(
//                                               widgets[15].vocabulary.vocab);
//                                         }
//                                       : null,
//                                   child: (matrix4by4state
//                                               .getResultOfSixteenWidget ==
//                                           1)
//                                       ? Container()
//                                       : Transform.scale(
//                                           scale: matrix4by4state
//                                                   .getSixteenWidgetState
//                                               ? 1.05
//                                               : 1.0,
//                                           child: Padding(
//                                             padding: EdgeInsets.all(2.5),
//                                             child: Stack(
//                                               children: <Widget>[
//                                                 widgets[15],
//                                                 Container(
//                                                   height: MediaQuery.of(context)
//                                                       .size
//                                                       .height,
//                                                   width: MediaQuery.of(context)
//                                                       .size
//                                                       .width,
//                                                   decoration: BoxDecoration(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             8.0),
//                                                     color: matrix4by4state
//                                                             .getSixteenWidgetState
//                                                         ? Colors.yellow
//                                                             .withOpacity(0.3)
//                                                         : Colors.white
//                                                             .withOpacity(0),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           )),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
