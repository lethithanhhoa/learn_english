import 'package:auto_size_text/auto_size_text.dart';
import 'package:flip_panel/flip_panel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_english/core/services/auth_service.dart';
import 'package:learn_english/provider/account_user.dart';
import 'package:learn_english/ui/common/side_menu_bar.dart';
import 'package:learn_english/ui/modules/general_parameter.dart';
import 'package:learn_english/ui/modules/route_name.dart';
import 'package:learn_english/ui/pages/loading_page.dart';
import 'package:learn_english/core/services/lesson_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

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
      if (accountUser.user.learningResult != null) {
        List<dynamic> temp = accountUser.user.learningResult.values.toList();
        temp.forEach((item) {
          if (item.toInt() == 100) count++;
        });
      }
      loading = false;
    }
    return Scaffold(
      drawer: kIsWeb ? NavigateDrawer() : null,
      appBar: kIsWeb
          ? AppBar(
              title: Text(
                'Profile',
                style: GoogleFonts.handlee(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
            )
          : null,
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
                          color: mainWidgetColor,
                          image: DecorationImage(
                              image: Image.asset(coverPhoto).image,
                              fit: BoxFit.cover)),
                    ),
                    Expanded(
                      child: Container(
                        height: MediaQuery.of(context).size.height,
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
                                  image:
                                      Image.network(accountUser.user.avatarUrl)
                                          .image,
                                  fit: BoxFit.fill),
                            ),
                          ),
                          AutoSizeText(
                            accountUser.user.name,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 40,
                              color: Colors.black.withOpacity(blackOpacity),
                            ),
                          ),
                          AutoSizeText(
                            'Email: ${accountUser.user.email}',
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black.withOpacity(blackOpacity)),
                          ),
                        ],
                      ),
                      // (kIsWeb)
                      //     ? Container()
                      //     :
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Achievement',
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.black.withOpacity(blackOpacity)),
                          ),
                          Container(
                            height: 170,
                            width: MediaQuery.of(context).size.width,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                itemOfAchievement(context, count,
                                    'Number of lessons reached 100%'),
                                itemOfAchievement(
                                    context, accountUser.user.exp, 'EXP'),
                                itemOfAchievement(
                                    context,
                                    accountUser.user.taptap,
                                    'Tap Tap High Score'),
                                itemOfAchievement(
                                    context,
                                    accountUser.user.memoryCard,
                                    'Memory Card Level'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          handleSignOut();
                          Navigator.pushNamedAndRemoveUntil(context,
                              RouteName.login, (Route<dynamic> route) => false);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: signOutButtonColor,
                            ),
                            child: Center(
                              child: Text(
                                'Sign Out',
                                style: TextStyle(
                                    fontSize: 20,
                                    color:
                                        Colors.black.withOpacity(blackOpacity)),
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

  Widget itemOfAchievement(BuildContext context, int number, String title) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Container(
        height: 160,
        width: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), color: mainWidgetColor),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlipPanel.builder(
                    itemsCount: 1,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Center(
                            child: AutoSizeText(
                              '${number}',
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(blackOpacity),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                Container(
                    height: 35,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: AutoSizeText(
                      title,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      minFontSize: 10,
                      style: TextStyle(fontSize: 16),
                    ))
              ]),
        ),
      ),
    );
  }
}
