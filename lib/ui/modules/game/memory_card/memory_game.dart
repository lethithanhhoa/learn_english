import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:learn_english/core/services/user_service.dart';
import 'package:learn_english/ui/modules/audio/audio_player.dart';
import 'package:learn_english/ui/modules/route_name.dart';
import 'package:learn_english/ui/provider/account_user.dart';
import 'package:learn_english/ui/provider/memory_card_state.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class Memory extends StatelessWidget {
  List<Vocabulary> vocabList;
  Memory({this.vocabList});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => MemoryCardState(vocabList: vocabList)),
        ChangeNotifierProvider(create: (context) => AccountUser()),
      ],
      child: MemoryCard(
          // vocabList: vocabList,
          ),
    );
  }
}

class MemoryCard extends StatelessWidget {
  bool loading = true;
  UserService userService = UserService();

  AudioCustomPlayer audioCustomPlayer = AudioCustomPlayer();
  Future<bool> onWillPop() {
    Fluttertoast.showToast(msg: "Tap 'Close' button to quit");
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    MemoryCardState memoryCardState = Provider.of<MemoryCardState>(context);
    AccountUser accountUser = Provider.of<AccountUser>(context);
    if (loading) {
      memoryCardState.generateCard();
      loading = false;
    }

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: Image.asset('assets/flat.jpg').image,
                          fit: BoxFit.cover))),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              FlatButton(
                                onPressed: (memoryCardState.checking == 0)
                                    ? () {
                                        audioCustomPlayer.stop();
                                        Navigator.pop(context);
                                      }
                                    : null,
                                child: Text('Quit'),
                                color: Colors.blue.withOpacity(0.3),
                              ),
                            ],
                          ),
                          Text(
                            'Level: ${memoryCardState.level}',
                            style: GoogleFonts.piedra(
                              color: Colors.blue,
                              fontSize: 50,
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: SingleChildScrollView(
                                child: Wrap(
                                  children: memoryCardState.cardList,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      (memoryCardState.checking == 2 && accountUser.exp >= 50)
                          ? AlertDialog(
                              content: Container(
                                height: 200,
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Center(
                                          child:
                                              Image.asset('assets/oh_no.jpg')),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                          style: GoogleFonts.handlee(
                                              textStyle: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 18)),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: 'Do you want to trade '),
                                            TextSpan(
                                              text: '${50} ',
                                              style: TextStyle(
                                                  color: Colors.orange[300],
                                                  fontSize: 25),
                                            ),
                                            TextSpan(
                                              text: 'EXP ',
                                              style: TextStyle(
                                                  color: Colors.green[300],
                                                  fontSize: 25),
                                            ),
                                            TextSpan(text: 'to continue?'),
                                          ]),
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                FlatButton(
                                  child: Text(
                                    'Yes',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  onPressed: () {
                                    userService.updateExp(
                                        accountUser.user.userId,
                                        accountUser.exp - 50);
                                    accountUser.decrementExp(50);
                                    memoryCardState.fetchState();
                                    memoryCardState.generateCard();
                                  },
                                ),
                                FlatButton(
                                  child: Text(
                                    'No',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  onPressed: () {
                                    if (accountUser.user.memoryCard <
                                        memoryCardState.level) {
                                      userService.updateMemoryCard(
                                          accountUser.user.userId,
                                          memoryCardState.level);
                                    }
                                    (kIsWeb)
                                        ? Navigator.pushNamedAndRemoveUntil(
                                            context,
                                            RouteName.memoryRankForWeb,
                                            (route) => false)
                                        : Navigator.pushNamedAndRemoveUntil(
                                            context,
                                            RouteName.memoryRank,
                                            (route) => false);
                                  },
                                ),
                              ],
                            )
                          : Container(),
                      (memoryCardState.checking == 2 && accountUser.exp < 50)
                          ? AlertDialog(
                              content: Container(
                                  height: 200,
                                  alignment: Alignment.center,
                                  child: Image.asset('assets/gameover.png')),
                              actions: [
                                FlatButton(
                                  child: Text(
                                    'Go to Ranking Page',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  onPressed: () {
                                    // memoryCardState.setIsFinishTrue();
                                    if (accountUser.user.memoryCard <
                                        memoryCardState.level) {
                                      userService.updateMemoryCard(
                                          accountUser.user.userId,
                                          memoryCardState.level);
                                    }
                                    (kIsWeb)
                                        ? Navigator.pushNamedAndRemoveUntil(
                                            context,
                                            RouteName.memoryRankForWeb,
                                            (route) => false)
                                        : Navigator.pushNamedAndRemoveUntil(
                                            context,
                                            RouteName.memoryRank,
                                            (route) => false);
                                  },
                                ),
                              ],
                            )
                          : Container(),
                      (memoryCardState.checking == 1)
                          ? AlertDialog(
                              content: Container(
                                  height: 200,
                                  alignment: Alignment.center,
                                  child: Image.asset('assets/congrat.jpg')),
                              actions: [
                                FlatButton(
                                  child: Text(
                                    'Exit Game',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  onPressed: () {
                                    // memoryCardState.setIsFinishTrue();
                                    if (accountUser.user.memoryCard <
                                        memoryCardState.level) {
                                      userService.updateMemoryCard(
                                          accountUser.user.userId,
                                          memoryCardState.level);
                                    }

                                    (kIsWeb)
                                        ? Navigator.pushNamedAndRemoveUntil(
                                            context,
                                            RouteName.memoryRankForWeb,
                                            (route) => false)
                                        : Navigator.pushNamedAndRemoveUntil(
                                            context,
                                            RouteName.memoryRank,
                                            (route) => false);
                                  },
                                ),
                                FlatButton(
                                  child: Text(
                                    'Next Level',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  onPressed: () {
                                    memoryCardState.fetchState();
                                    memoryCardState.nextLevel();
                                  },
                                )
                              ],
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
