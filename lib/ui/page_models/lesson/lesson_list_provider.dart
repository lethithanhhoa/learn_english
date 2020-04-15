import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/core/models/lesson.dart';
import 'package:learn_english/core/services/database_service.dart';
import 'package:learn_english/ui/page_models/lesson/lesson_list.dart';
import 'package:provider/provider.dart';

class LessonListProvider extends StatelessWidget {
  Database database = Database();
  @override
  Widget build(BuildContext context) {
    return FutureProvider<List<Lesson>>.value(
      value: database.getListOfLesson(),
      child: LessonList(),
    );
  }
}

