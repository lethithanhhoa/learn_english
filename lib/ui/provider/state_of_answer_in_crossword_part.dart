import 'package:flutter/cupertino.dart';

class CrosswordAnswerState extends ChangeNotifier {
  List<dynamic> _answer = [];

  List<dynamic> get getAnswer => _answer;

  addToList(String value){
    _answer.add(value);
    notifyListeners();
  }

  removeFromList(int index){
    _answer.removeAt(index);
    notifyListeners();
  }

  fetchList(){
    _answer = [];
    notifyListeners();
  }
}
