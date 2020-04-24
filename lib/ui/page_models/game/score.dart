import 'package:flutter/cupertino.dart';

class Score extends ChangeNotifier{
  int _score = 0;

  int get getScore => _score;

  increment(){
    _score ++;
    notifyListeners();
  }
}