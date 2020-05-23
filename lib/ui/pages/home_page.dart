import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learn_english/ui/page_models/game/game_page.dart';
import 'package:learn_english/ui/page_models/lesson/lesson_page.dart';
import 'package:learn_english/ui/page_models/rank/rank_page.dart';
import 'package:learn_english/ui/pages/account_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime currentBackPressTime;
  int _selectedIndex = 0;

  final _pageOption = [
    LessonPage(),
    GamePage(),
    
    RankPage(),
    // StartingPage(),
    AccountPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        body: Center(
          child: _pageOption[_selectedIndex],
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
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.teal,
          unselectedItemColor: Colors.white,
          
          onTap: _onItemTapped,
        ),
        ),
      ),
    );
  }

  Future<bool> onWillPop() {
    // DateTime now = DateTime.now();
    // if (currentBackPressTime == null ||
    //     now.difference(currentBackPressTime) > Duration(seconds: 2)) {
    //   currentBackPressTime = now;
    //   Fluttertoast.showToast(msg: "Press back again to exit");
    //   return Future.value(false);
    // }
    return Future.value(false);
  }
}
