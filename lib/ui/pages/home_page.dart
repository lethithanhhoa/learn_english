import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/ui/page_models/game/game_page.dart';
import 'package:learn_english/ui/page_models/lesson/lesson_page.dart';
import 'package:learn_english/ui/page_models/rank/rank_page.dart';
import 'package:learn_english/ui/pages/account_page.dart';
import 'package:learn_english/ui/state/indexHomePage.dart';
import 'package:provider/provider.dart';

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
      RankPage(
        initialPage: indexHomePage.indexRank,
      ),
      AccountPage(),
    ];
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        body: Center(
          child: _pageOption[indexHomePage.index],
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(canvasColor: Colors.green[200]),
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
                title: Text('Acount'),
              ),
            ],
            currentIndex: indexHomePage.index,
            selectedItemColor: Colors.teal,
            unselectedItemColor: Colors.white,
            onTap: indexHomePage.setIndex,
          ),
        ),
      ),
    );
  }

  Future<bool> onWillPop() {
    return Future.value(false);
  }
}
