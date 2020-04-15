import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/core/models/lesson.dart';
import 'package:learn_english/ui/common/slider_in_lesson_list.dart';
import 'package:learn_english/ui/modules/route_name.dart';
import 'package:learn_english/ui/pages/loading_page.dart';
import 'package:provider/provider.dart';

class LessonList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: Consumer<List<Lesson>>(builder: (context, value, child) {
        if (value == null) return LoadingPage();
        return ListView.builder(
            itemCount: value.length,
            itemBuilder: (context, index) {
              Lesson currentLesson = value[index];
              return ListTile(
                  title: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            width: 100.0,
                            height: 80.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.green[100],
                              image: DecorationImage(
                                  image: Image.asset('assets/ba6.jpg').image,
                                  fit: BoxFit.fill),
                            ),
                          ),
                          SizedBox(width: 15),
                          Expanded(
                              child: Text(
                                '${currentLesson.name}',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                                overflow: TextOverflow.fade,
                              ))
                        ],
                      ),
                      SliderInLessonList(),
                      
                    ],
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, RouteName.vocab,
                        arguments: currentLesson.lessonId);
                  });
            });
      }),
    );
  }
}

class ImageDecoration extends StatelessWidget {
  const ImageDecoration({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/ba6.jpg');
  }
}
