import 'package:flutter/cupertino.dart';

class NumOfCorrectAnswer extends ChangeNotifier{
  int number = 0;

  increment(){
    number = number + 1;
    notifyListeners();
  }

}