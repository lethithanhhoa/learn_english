import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_english/core/models/user.dart';
import 'package:learn_english/core/services/firestore_service.dart';
import 'package:learn_english/ui/common/side_menu_bar.dart';
import 'package:learn_english/ui/provider/account_user.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'exp_ranking_page.dart';
import 'memory_ranking_page.dart';
import 'taptap_ranking_page.dart';

class RankingPage extends StatelessWidget {
  FireStoreService fireStoreService = FireStoreService();
  int initialPage;
  RankingPage({this.initialPage});

  @override
  Widget build(BuildContext context) {
    final PageController controller =
        new PageController(initialPage: initialPage);
    return MultiProvider(
      providers: [
        FutureProvider<List<User>>.value(
          value: fireStoreService.getAllUser(),
        ),
        ChangeNotifierProvider(
          create: (context) => AccountUser(),
        )
      ],
      child: Scaffold(
        drawer: kIsWeb ? NavigateDrawer() : null,
        appBar: kIsWeb
            ? AppBar(
                title: Text(
                  'Ranking Table',
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
                    spacing: 15.0), // your preferred effect
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
