import 'package:flutter/cupertino.dart';

class Index extends ChangeNotifier{
  int _index = 0;
  int get getIndex => _index;
  increment(){
    _index ++;
    notifyListeners();
  }

  setIndex(int number){
    _index = number;
    notifyListeners();
  }

  decrement(){
    _index --;
    notifyListeners();
  }

}