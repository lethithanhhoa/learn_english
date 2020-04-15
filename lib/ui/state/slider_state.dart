import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class SliderState extends ChangeNotifier{
  int _maxOfSlider = 0;

  int get getMaxOfSlider => _maxOfSlider;
  
  setMaxOfSlider(int value){
    _maxOfSlider = value;
    notifyListeners();
  }
}