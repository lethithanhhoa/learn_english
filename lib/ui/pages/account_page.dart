import 'package:auto_size_text/auto_size_text.dart';
import 'package:flip_panel/flip_panel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/core/services/auth_service.dart';
import 'package:learn_english/ui/modules/route_name.dart';
import 'package:learn_english/ui/pages/loading_page.dart';
import 'package:learn_english/core/services/lesson_service.dart';
import 'package:learn_english/ui/state/account_user.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AccountUser()),
      ],
      child: AccountChildPage(),
    );
  }
}

class AccountChildPage extends StatelessWidget {
  bool loading = true;
  int count = 0;
  AuthService authService = AuthService();
  LessonService lessonService = LessonService();

  Future<Null> handleSignOut() async {
    await authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    AccountUser accountUser = Provider.of<AccountUser>(context);

    if (accountUser.user == null) return LoadingPage();
    if (loading) {
      if (accountUser.user.learningState != null) {
        List<dynamic> temp = accountUser.user.learningState.values.toList();
        temp.forEach((item) {
          if (item.toInt() == 100) count++;
        });
      }
      loading = false;
    }
    return Scaffold(
      // backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 180,
                      decoration: BoxDecoration(
                          color: Colors.green[200],
                          image: DecorationImage(
                              image: Image.asset('assets/cover.jpg').image,
                              fit: BoxFit.cover)),
                    ),
                    Expanded(
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        // color: Colors.,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            height: 160,
                            width: 160,
                            decoration: BoxDecoration(
                              color: Colors.yellow.withOpacity(0.1),
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: Image.network(
                                          accountUser.user.avatarUrl)
                                      .image,
                                  fit: BoxFit.fill),
                            ),
                          ),
                          AutoSizeText(
                            accountUser.user.name,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 40,
                              color: Colors.black.withOpacity(0.7),
                            ),
                          ),
                          AutoSizeText(
                            'Email: ${accountUser.user.email}',
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black.withOpacity(0.7)),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Achievement',
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.black.withOpacity(0.7)),
                          ),
                          Container(
                            height: 170,
                            width: MediaQuery.of(context).size.width,
                            // color: Colors.pinkAccent,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Container(
                                    height: 160,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Colors.green[200],
                                    ),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          FlipPanel.builder(
                                              itemsCount: 1,
                                              itemBuilder: (context, index) {
                                                return Container(
                                                  height: 100,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    color: Colors.white,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(5.0),
                                                    child: Center(
                                                      child: AutoSizeText(
                                                        '${count}',
                                                        maxLines: 1,
                                                        style: TextStyle(
                                                          fontSize: 40,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black
                                                              .withOpacity(0.7),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.0),
                                            child: Container(
                                                height: 40,
                                                alignment: Alignment.center,
                                                child: Text(
                                                  'Num of lessons reached 100%',
                                                  textAlign: TextAlign.center,
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                )),
                                          )
                                        ]),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Container(
                                    height: 150,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Colors.green[200],
                                    ),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          FlipPanel.builder(
                                              itemsCount: 1,
                                              itemBuilder: (context, index) {
                                                return Container(
                                                  height: 100,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    color: Colors.white,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(5.0),
                                                    child: Center(
                                                      child: AutoSizeText(
                                                        '${accountUser.user.exp}',
                                                        maxLines: 1,
                                                        style: TextStyle(
                                                          fontSize: 40,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black
                                                              .withOpacity(0.7),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.0),
                                            child: Container(
                                                height: 40,
                                                alignment: Alignment.center,
                                                child: Text(
                                                  'EXP',
                                                  textAlign: TextAlign.center,
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                )),
                                          )
                                        ]),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Container(
                                    height: 150,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Colors.green[200],
                                    ),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          FlipPanel.builder(
                                              itemsCount: 1,
                                              itemBuilder: (context, index) {
                                                return Container(
                                                  height: 100,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    color: Colors.white,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(5.0),
                                                    child: Center(
                                                      child: AutoSizeText(
                                                        '${accountUser.user.taptap}',
                                                        maxLines: 1,
                                                        style: TextStyle(
                                                          fontSize: 40,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black
                                                              .withOpacity(0.7),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.0),
                                            child: Container(
                                                height: 40,
                                                alignment: Alignment.center,
                                                child: Text(
                                                  'Tap Tap High Score',
                                                  textAlign: TextAlign.center,
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                )),
                                          )
                                        ]),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Container(
                                    height: 150,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Colors.green[200],
                                    ),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          FlipPanel.builder(
                                              itemsCount: 1,
                                              itemBuilder: (context, index) {
                                                return Container(
                                                  height: 100,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    color: Colors.white,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(5.0),
                                                    child: Center(
                                                      child: AutoSizeText(
                                                        '${accountUser.user.memory}',
                                                        maxLines: 1,
                                                        style: TextStyle(
                                                          fontSize: 40,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black
                                                              .withOpacity(0.7),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.0),
                                            child: Container(
                                                height: 40,
                                                alignment: Alignment.center,
                                                child: Text(
                                                  'Memory Card Level',
                                                  textAlign: TextAlign.center,
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                )),
                                          ),
                                        ]),
                                  ),
                                ),
                                // Padding(
                                //   padding: const EdgeInsets.all(5.0),
                                //   child: Container(
                                //     height: 150,
                                //     width: 120,
                                //     decoration: BoxDecoration(
                                //       borderRadius: BorderRadius.circular(10.0),
                                //       color: Colors.green[200],
                                //     ),
                                //     child: Column(
                                //         mainAxisAlignment:
                                //             MainAxisAlignment.center,
                                //         children: <Widget>[
                                //           FlipPanel.builder(
                                //               itemsCount: 1,
                                //               itemBuilder: (context, index) {
                                //                 return Container(
                                //                   height: 100,
                                //                   width: 100,
                                //                   decoration: BoxDecoration(
                                //                     borderRadius:
                                //                         BorderRadius.circular(
                                //                             10.0),
                                //                     color: Colors.white,
                                //                   ),
                                //                   child: Padding(
                                //                     padding:
                                //                         EdgeInsets.all(5.0),
                                //                     child: Center(
                                //                       child: AutoSizeText(
                                //                         '${accountUser.user.matrix4by4}',
                                //                         maxLines: 1,
                                //                         style: TextStyle(
                                //                           fontSize: 40,
                                //                           fontWeight:
                                //                               FontWeight.bold,
                                //                           color: Colors.black
                                //                               .withOpacity(0.7),
                                //                         ),
                                //                       ),
                                //                     ),
                                //                   ),
                                //                 );
                                //               }),
                                //           Padding(
                                //             padding: EdgeInsets.symmetric(
                                //                 horizontal: 10.0),
                                //             child: Container(
                                //                 height: 40,
                                //                 alignment: Alignment.center,
                                //                 child: Text(
                                //                   'Matrix 4x4 high score',
                                //                   textAlign: TextAlign.center,
                                //                   style:
                                //                       TextStyle(fontSize: 16),
                                //                 )),
                                //           ),
                                //         ]),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          handleSignOut();
                          Navigator.pushNamedAndRemoveUntil(
                              context,
                              RouteName.login,
                              (Route<dynamic> route) => false);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: Colors.orange[200],
                            ),
                            child: Center(
                              child: Text(
                                'Sign Out',
                                style: TextStyle(
                                    // backgroundColor: Colors.green,
                                    fontSize: 20),
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
      ),
    );
  }
}
