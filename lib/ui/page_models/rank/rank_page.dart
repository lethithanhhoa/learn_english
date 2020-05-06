import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/core/models/user.dart';
import 'package:learn_english/core/services/database_service.dart';
import 'package:learn_english/ui/page_models/rank/exp_ranking_page.dart';
import 'package:learn_english/ui/page_models/rank/matrix2by2_ranking_page.dart';
import 'package:learn_english/ui/page_models/rank/matrix3by3_ranking_page.dart';
import 'package:learn_english/ui/page_models/rank/matrix4by4_ranking_page.dart';
import 'package:learn_english/ui/page_models/rank/rank_list.dart';
import 'package:learn_english/ui/state/account_user.dart';
import 'package:provider/provider.dart';

class RankPage extends StatelessWidget {
  DatabaseService database = DatabaseService();
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
      child: PageView(
        children: <Widget>[
          ExpRankingPage(),
          Matrix2by2RankingPage(),
          Matrix3by3RankingPage(),
          Matrix4by4RankingPage(),
        ],
      ),
    );
  }
}
