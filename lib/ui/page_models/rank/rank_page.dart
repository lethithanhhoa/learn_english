import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/core/models/user.dart';
import 'package:learn_english/core/services/database_service.dart';
import 'package:learn_english/ui/page_models/rank/exp_ranking_page.dart';
import 'package:learn_english/ui/page_models/rank/matrix2by2_ranking_page.dart';
import 'package:learn_english/ui/page_models/rank/matrix3by3_ranking_page.dart';
import 'package:learn_english/ui/page_models/rank/matrix4by4_ranking_page.dart';
import 'package:learn_english/ui/state/account_user.dart';
import 'package:provider/provider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class RankPage extends StatelessWidget {
  DatabaseService database = DatabaseService();
  final PageController controller = new PageController();
  @override
  Widget build(BuildContext context) {
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
            Matrix2by2RankingPage(),
            Matrix3by3RankingPage(),
            Matrix4by4RankingPage(),
          ],
          controller: controller,
        ),
        Container(
          margin: EdgeInsets.all(8.0),
          alignment: Alignment.topCenter,
          child: SmoothPageIndicator(
            controller: controller, // PageController
            count: 4,
            effect: ExpandingDotsEffect(
              dotColor: Colors.white.withOpacity(0.5),
              dotWidth: 5.0,
              dotHeight: 5.0,
              activeDotColor: Colors.white,
              spacing: 10.0
            ), // your preferred effect
          ),
        ),
      
      ]),
      ),
    );
  }
}
