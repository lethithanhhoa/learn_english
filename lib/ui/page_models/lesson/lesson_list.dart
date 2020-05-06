import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/core/models/lesson.dart';
import 'package:learn_english/ui/common/slider_at_lesson_list.dart';
import 'package:learn_english/ui/modules/route_name.dart';
import 'package:learn_english/ui/pages/loading_page.dart';
import 'package:learn_english/ui/state/account_user.dart';

class LessonList extends StatelessWidget {
  List<Lesson> value;
  AccountUser accountUser;
  LessonList({this.value, this.accountUser});

  @override
  Widget build(BuildContext context) {
    if (value == null || accountUser.user == null) return LoadingPage();
    return ListView.builder(
        itemCount: value.length,
        itemBuilder: (context, index) {
          Lesson currentLesson = value[index];
          int percent = 0;
          if (accountUser.user.learningState != null) {
            if (accountUser.user.learningState[currentLesson.lessonId] != null)
              percent = (accountUser.user.learningState[currentLesson.lessonId])
                  .toInt();
          }
          return ItemWidget(context, currentLesson, percent);
        });
  }

  Widget ItemWidget(BuildContext context, Lesson currentLesson, int percent) {
    print(currentLesson.image);
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 5, 20, 5),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, RouteName.vocab,
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
                          image: Image.asset('assets/' + currentLesson.image)
                              .image),
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
                      child: Text(
                        currentLesson.lessonName,
                        overflow: TextOverflow.fade,
                        softWrap: true,
                        maxLines: 2,
                        style: TextStyle(
                          color: Colors.white,
                          backgroundColor: Colors.green.withOpacity(0.7),
                          // backgroundColor: Colors.white.withOpacity(0.6),
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
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
