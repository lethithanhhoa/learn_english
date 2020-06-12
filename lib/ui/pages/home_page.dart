import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_english/core/services/auth_service.dart';
import 'package:learn_english/provider/index_in_home_page.dart';
import 'package:learn_english/ui/common/side_menu_bar.dart';
import 'package:learn_english/ui/modules/general_parameter.dart';
import 'package:learn_english/ui/page_models/game/game_page.dart';
import 'package:learn_english/ui/page_models/lesson/lesson_page.dart';
import 'package:learn_english/ui/page_models/rank/ranking_page.dart';
import 'package:learn_english/ui/pages/account_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class HomePage extends StatelessWidget {
  int initialHomePage;
  int initialRankPage;
  HomePage({@required this.initialHomePage, @required this.initialRankPage});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) =>
              IndexHomePage(index: initialHomePage, indexRank: initialRankPage),
        )
      ],
      child: HomePageState(),
    );
  }
}

class HomePageState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    IndexHomePage indexHomePage = Provider.of<IndexHomePage>(context);
    final _pageOption = [
      LessonPage(),
      GamePage(),
      RankingPage(
        initialPage: indexHomePage.indexRank,
      ),
      AccountPage(),
    ];

    return WillPopScope(
      onWillPop: onWillPop,
      child: (!kIsWeb)
          ? Scaffold(
              body: Center(
                child: _pageOption[indexHomePage.index],
              ),
              bottomNavigationBar: Theme(
                data:
                    Theme.of(context).copyWith(canvasColor: Colors.green[200]),
                child: BottomNavigationBar(
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      title: Text('Home'),
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.games),
                      title: Text('Game'),
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.school),
                      title: Text('Ranking'),
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.account_circle),
                      title: Text('Account'),
                    ),
                  ],
                  currentIndex: indexHomePage.index,
                  selectedItemColor: Colors.teal,
                  unselectedItemColor: Colors.white,
                  onTap: indexHomePage.setIndex,
                ),
              ),
            )
          : Scaffold(
              drawer: NavigateDrawer(),
              appBar: AppBar(
                title: Text(
                  'Home',
                  style: GoogleFonts.handlee(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
              body: LessonPage(),
            ),
    );
  }

  Future<bool> onWillPop() {
    return Future.value(false);
  }
}
