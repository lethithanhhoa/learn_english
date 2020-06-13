import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CorrectAnswer extends ChangeNotifier{
  String _correctAnswer = '';
  String get getCorrectAnswer => _correctAnswer;

  setCorrectAnswer(String newString){
    _correctAnswer = newString;
    notifyListeners();
  }
}