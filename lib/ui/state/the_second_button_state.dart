import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class TheSecondButtonState extends ChangeNotifier{
  bool _clicked = false;
  String _value = '';

  bool get getClicked => _clicked;
  String get getValue => _value;

  setClicked(String value){
    _clicked = true;
    _value = value;
    notifyListeners();
  }

  setValue(String value){
    _value = value;
    notifyListeners();
  }

  fetchState(){
    _clicked = false;
    _value = '';
    notifyListeners();
  }
}