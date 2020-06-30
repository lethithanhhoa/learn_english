import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_english/core/models/lesson.dart';
import 'package:learn_english/core/services/firestore_service.dart';
import 'package:learn_english/ui/provider/account_user.dart';
import 'package:provider/provider.dart';
import 'package:learn_english/core/services/lesson_service.dart';

import '../../general_parameter.dart';
import '../loading_page.dart';
import '../route_name.dart';
import 'lesson_list.dart';

class LessonPage extends StatelessWidget {
  // LessonService _lessonService = LessonService();
  FireStoreService _fireStoreService = FireStoreService();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        FutureProvider<List<Lesson>>.value(
          // value: _lessonService.getAllLesson(),
          value: _fireStoreService.getAllLessons(),
        ),
        ChangeNotifierProvider(
          create: (_) => AccountUser(),
        ),
      ],
      child: Scaffold(
        backgroundColor: backgroundHomPageColor,
        body: SafeArea(
          child: Consumer<List<Lesson>>(builder: (context, value, child) {
            AccountUser accountUser = Provider.of<AccountUser>(context);
            if (value == null || accountUser.user == null) return LoadingPage();

            return (!kIsWeb)
                // UI for Mobile app
                ? Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(30, 0, 20, 0),
                        child: Container(
                          height: 80,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                IconButton(
                                  padding: EdgeInsets.all(0.0),
                                  icon: Icon(Icons.list,
                                      size: 40, color: Colors.white),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, RouteName.review);
                                  },
                                ),
                                Text(
                                  'Lessons',
                                  style: TextStyle(
                                      fontSize: 35,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ]),
                        ),
                      ),
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Container(
                            height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                              color: Colors.green[200],
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(45)),
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 45, 0, 0),
                              child: LessonList(
                                  value: value, accountUser: accountUser),
                            )),
                      )),
                    ],
                  )
                //UI for Web
                : SingleChildScrollView(
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            height: (MediaQuery.of(context).size.width <
                                    MediaQuery.of(context).size.height)
                                ? MediaQuery.of(context).size.height * 2 / 5
                                : MediaQuery.of(context).size.height / 2,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Stack(
                                    children: [
                                      (MediaQuery.of(context).size.width < 400)
                                          ? Container()
                                          : Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              alignment: Alignment.centerRight,
                                              child: Image.asset(
                                                'assets/study.jpg',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        alignment:
                                            (MediaQuery.of(context).size.width <
                                                    400)
                                                ? Alignment.center
                                                : Alignment.centerLeft,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            AutoSizeText(
                                              'EFK',
                                              maxLines: 1,
                                              style: GoogleFonts.audiowide(
                                                fontSize: 80,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.teal,
                                              ),
                                            ),
                                            AutoSizeText(
                                              'Change The Future',
                                              maxLines: 1,
                                              style: GoogleFonts.audiowide(
                                                fontSize: 25,
                                                color: Colors.teal,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  width: MediaQuery.of(context).size.width,
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.only(left: 20),
                                  child: Text(
                                    'All Lesson',
                                    style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Arial',
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20.0),
                            child: LessonList(
                                value: value, accountUser: accountUser),
                          ),
                        ],
                      ),
                    ),
                  );
          }),
        ),
      ),
    );
  }
}
