import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class TheSecondButtonState extends ChangeNotifier{
  bool _clicked = false;
  bool get getClicked => _clicked;
  setClicked(){
    _clicked = true;
    notifyListeners();
  }

  fetchState(){
    _clicked = false;
    notifyListeners();
  }
}