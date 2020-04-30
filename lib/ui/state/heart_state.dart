import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeartState extends ChangeNotifier {
  int _heartNum = 5;
  int get getHeartNum => _heartNum;
  decrementHeart() {
    _heartNum--;
    notifyListeners();
  }

  setHeartNum(int number) {
    _heartNum = number;
    notifyListeners();
  }
}
