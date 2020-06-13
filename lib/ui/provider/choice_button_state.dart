import 'package:flutter/cupertino.dart';

class ChoiceButtonState extends ChangeNotifier {
  List<bool> _clickedList = new List.filled(3, false);
  String _value = '';

  bool getClicked(int index) {
    return _clickedList[index];
  }

  bool getState() {
    if (_clickedList == [false, false, false]) return false;
    return true;
  }

  String get getValue => _value;

  setClick(int index, String value) {
    _clickedList.fillRange(0, 3, false);
    _clickedList[index] = true;
    _value = value;
    notifyListeners();
  }

  setValue(String value) {
    _value = value;
    notifyListeners();
  }

  fetchState() {
    _clickedList.fillRange(0, 3, false);
    _value = '';
    notifyListeners();
  }
}
