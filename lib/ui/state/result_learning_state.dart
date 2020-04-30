import 'package:flutter/cupertino.dart';

class ResultLearningState extends ChangeNotifier {
  String lessonId;
  int _percent_correct = 0;

  ResultLearningState({this.lessonId});
  int get getPercentCorrect => _percent_correct;

  setPercentCorrect(int percent) {
    _percent_correct = percent;
    notifyListeners();
  }
}
