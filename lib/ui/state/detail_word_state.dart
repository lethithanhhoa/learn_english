import 'package:flutter/cupertino.dart';


class DetailWordState extends ChangeNotifier{
  bool _state = true;
  bool get getState => _state;
  setState(){
    if (_state) _state = false;
    else _state = true;
    notifyListeners();
  }
  setStateToTrue(){
    _state = true;
    notifyListeners();
  }
}