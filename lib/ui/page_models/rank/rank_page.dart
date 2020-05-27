import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/core/models/user.dart';
import 'package:learn_english/core/services/database_service.dart';
import 'package:learn_english/ui/page_models/rank/exp_ranking_page.dart';
import 'package:learn_english/ui/page_models/rank/memory_ranking_page.dart';
import 'package:learn_english/ui/page_models/rank/taptap_ranking_page.dart';
import 'package:learn_english/ui/state/account_user.dart';
import 'package:provider/provider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class RankPage extends StatelessWidget {
  DatabaseService database = DatabaseService();
  int initialPage;
  RankPage({this.initialPage});
  
  @override
  Widget build(BuildContext context) {
    final PageController controller = new PageController(initialPage: initialPage);
    return MultiProvider(
      providers: [
        FutureProvider<List<User>>.value(
          value: database.getAllUser(),
        ),
        ChangeNotifierProvider(
          create: (context) => AccountUser(),
        )
      ],
      child: SafeArea(
      child: Stack(children: [
        PageView(
          children: <Widget>[
            ExpRankingPage(),
            TapTapRankingPage(),
            MemoryRankingPage(),
           
          ],
          controller: controller,
        ),
        Container(
          margin: EdgeInsets.all(5.0),
          alignment: Alignment.topCenter,
          child: SmoothPageIndicator(
            controller: controller, // PageController
            count: 3,
            effect: ExpandingDotsEffect(
              dotColor: Colors.white.withOpacity(0.5),
              dotWidth: 8.0,
              dotHeight: 4.0,
              activeDotColor: Colors.white,
              spacing: 15.0
            ), // your preferred effect
          ),
        ),
      
      ]),
      ),
    );
  }
}
