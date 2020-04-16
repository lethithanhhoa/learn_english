import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/core/models/lesson.dart';
import 'package:learn_english/ui/common/slider_at_lesson_list.dart';
import 'package:learn_english/ui/modules/route_name.dart';
import 'package:learn_english/ui/pages/loading_page.dart';
import 'package:learn_english/ui/state/account_user.dart';
import 'package:learn_english/ui/state/result_learning_state.dart';
import 'package:provider/provider.dart';

class LessonList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AccountUser accountUser = Provider.of<AccountUser>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Consumer<List<Lesson>>(builder: (context, value, child) {
          if (value == null || accountUser.user == null) return LoadingPage();
          return ListView.builder(
              itemCount: value.length,
              itemBuilder: (context, index) {
                Lesson currentLesson = value[index];
                int percent = 0;
                if (accountUser.user.learningState[currentLesson.lessonId] !=
                    null)
                  percent =
                      (accountUser.user.learningState[currentLesson.lessonId]).toInt();
                return ListTile(
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      SliderAtLessonList(percent: percent),
                      Text('${percent}%'),
                    ],
                  ),
                  title: Container(
                    height: 150,
                    // color: Colors.yellow,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                            child: Stack(
                          children: <Widget>[
                            FadeInImage.assetNetwork(
                              height: 150,
                              width: MediaQuery.of(context).size.width,
                              placeholder: 'assets/waiting_image.gif',
                              image: currentLesson.image,
                              fit: BoxFit.cover,
                              fadeInCurve: Curves.bounceInOut,
                            ),
                            Container(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  currentLesson.name,
                                  overflow: TextOverflow.fade,
                                  softWrap: true,
                                  maxLines: 2,
                                  style: TextStyle(
                                    color: Colors.pink,
                                    backgroundColor:
                                        Colors.white.withOpacity(0.9),
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )),
                          ],
                        )),
                        // Container(
                        //   width: 90,
                        //   height: 150,
                        //   alignment: Alignment.bottomCenter,
                        //   child: Stack(
                        //     children: <Widget>[
                        //       Container(
                        //         width: 60,
                        //         height: 60,

                        //         decoration: BoxDecoration(

                        //           image: DecorationImage(
                        //               image: Image.asset('assets/pot.png').image,
                        //               fit: BoxFit.scaleDown),
                        //         ),
                        //       ),
                        //       (accountUser.user.learningState[
                        //                   currentLesson.lessonId] !=
                        //               null)
                        //           ? Text(
                        //               '${accountUser.user.learningState[currentLesson.lessonId]}')
                        //           : Text(''),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, RouteName.vocab,
                        arguments: currentLesson.lessonId);
                  },
                );
              });
        }),
      ),
    );
  }
}
