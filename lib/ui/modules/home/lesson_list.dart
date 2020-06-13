import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/core/models/lesson.dart';
import 'package:learn_english/ui/common/slider_at_lesson_list.dart';
import 'package:learn_english/ui/provider/account_user.dart';

import '../../general_parameter.dart';
import '../loading_page.dart';
import '../route_name.dart';

class LessonList extends StatelessWidget {
  List<Lesson> value;
  AccountUser accountUser;
  LessonList({this.value, this.accountUser});
  int numOfItem;
  @override
  Widget build(BuildContext context) {
    if (value == null || accountUser.user == null) return LoadingPage();
    if (MediaQuery.of(context).size.width < 400)
      numOfItem = 1;
    else if (MediaQuery.of(context).size.width < 800)
      numOfItem = 2;
    else if (MediaQuery.of(context).size.width < 1200)
      numOfItem = 3;
    else
      numOfItem = 4;
    return (!kIsWeb)
        ? ListView.builder(
            itemCount: value.length,
            itemBuilder: (context, index) {
              Lesson currentLesson = value[index];
              int percent = 0;
              if (accountUser.user.learningResult != null) {
                if (accountUser.user.learningResult[currentLesson.lessonId] !=
                    null)
                  percent =
                      (accountUser.user.learningResult[currentLesson.lessonId])
                          .toInt();
              }
              return ItemWidget(context, currentLesson, percent);
            })

        //UI for Web
        : GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: numOfItem,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 1.5,
            ),
            itemCount: value.length,
            itemBuilder: (context, index) {
              Lesson currentLesson = value[index];
              int percent = 0;
              if (accountUser.user.learningResult != null) {
                if (accountUser.user.learningResult[currentLesson.lessonId] !=
                    null)
                  percent =
                      (accountUser.user.learningResult[currentLesson.lessonId])
                          .toInt();
              }
              return ItemWidgetForWeb(context, currentLesson, percent);
            });
  }

  Widget ItemWidgetForWeb(
      BuildContext context, Lesson currentLesson, int percent) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RouteName.learn,
            arguments: currentLesson.lessonId);
      },
      child: Container(
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                                image: Image.network(currentLesson.image).image,
                                fit: BoxFit.cover)),
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        child: Container(
                          height: 40,
                          width: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: primaryColor.withOpacity(0.7),
                              shape: BoxShape.circle),
                          child: Text(
                            '${percent}%',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  )),
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                child: AutoSizeText(
                  currentLesson.lessonName,
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.white,
                    // backgroundColor: Colors.green.withOpacity(0.7),
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget ItemWidget(BuildContext context, Lesson currentLesson, int percent) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 5, 20, 5),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, RouteName.learn,
              arguments: currentLesson.lessonId);
        },
        child: Column(
          children: <Widget>[
            Container(
              height: 160,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    topRight: Radius.circular(25)),
              ),
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 160,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(25),
                          topRight: Radius.circular(25)),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.network(currentLesson.image).image),
                    ),
                  ),
                  Container(
                      alignment: Alignment.bottomLeft,
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(25),
                            topRight: Radius.circular(25)),
                      ),
                      height: 160,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 25),
                        child: Text(
                          currentLesson.lessonName,
                          overflow: TextOverflow.fade,
                          softWrap: true,
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.white,
                            backgroundColor: Colors.green.withOpacity(0.7),
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      )),
                ],
              ),
            ),
            SliderAtLessonList(
              percent: percent,
            )
          ],
        ),
      ),
    );
  }
}
