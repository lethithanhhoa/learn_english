import 'package:flutter/cupertino.dart';

class StateOfButton extends ChangeNotifier {
  bool _disable = false;
  String _nameButton = 'CHECKING';
  int _clickedNum = 0;

 

  bool get getDisable => _disable;
  String get getNameButton => _nameButton;
  int get getClickedNum => _clickedNum;

  incrementClickedNum(){
    _clickedNum ++;
    notifyListeners();
  }

  setDefaultClickedNum(){
    _clickedNum = 0;
    notifyListeners();
  }

  setNameToContinue(){
    _nameButton = 'CONTINUE';
    notifyListeners();
  }

  setNameToChecking(){
    _nameButton = 'CHECKING';
    notifyListeners();
  }

  setEnable() {
    _disable = true;
    notifyListeners();
  }

  setDisable() {
    _disable = false;
    notifyListeners();
  }
}
