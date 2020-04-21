import 'package:flutter/cupertino.dart';

class Matrix2By2State extends ChangeNotifier {
  bool _isFirstWidget = false;
  bool _isSecondWidget = false;
  bool _isThirdWidget = false;
  bool _isForWidget = false;
  List<String> _answers = [];
  int _firstWidgetIsCorrect = 0;
  int _secondWidgetIsCorrect = 0;
int _thirdWidgetIsCorrect = 0;
  int _forWidgetIsCorrect = 0;

  bool get getFirstWidgetState => _isFirstWidget;
  bool get getSecondWidgetState => _isSecondWidget;
  bool get getThirdWidgetState => _isThirdWidget;
  bool get getForWidgetState => _isForWidget;
  List<String> get getAnswers => _answers;
  int get getResultOfFirstWidget => _firstWidgetIsCorrect;
  int get getResultOfSecondWidget => _secondWidgetIsCorrect;
  int get getResultOfThirdWidget => _thirdWidgetIsCorrect;
  int get getResultOfForWidget => _forWidgetIsCorrect;

  checkAnswer(){
    print(_answers);
    if(_answers.length == 2){
      if (_answers[0] == _answers[1]){
        print('TRUE');
        if (_isFirstWidget) _firstWidgetIsCorrect = 1;
        if (_isSecondWidget) _secondWidgetIsCorrect = 1;
        if (_isThirdWidget) _thirdWidgetIsCorrect = 1;
        if (_isForWidget) _forWidgetIsCorrect = 1;
      }
      else {
        print('FALSE');
        if (_isFirstWidget) _firstWidgetIsCorrect = 2;
        if (_isSecondWidget) _secondWidgetIsCorrect = 2;
        if (_isThirdWidget) _thirdWidgetIsCorrect = 2;
        if (_isForWidget) _forWidgetIsCorrect = 2;
      };
      _answers = [];
    }
    notifyListeners();
  }

  setFirstWidgetState(String value) {
    if (_isFirstWidget){
      _isFirstWidget = false;
      _answers = [];
    }
      
    else{
      _isFirstWidget = true;
      _answers.add(value);
      checkAnswer();
    }
    notifyListeners();
  }

  setSecondWidgetState(String value) {
    if (_isSecondWidget){
      _isSecondWidget = false;
      _answers = [];
    }
    else{
      _isSecondWidget = true;
      _answers.add(value);
      checkAnswer();
    }
    notifyListeners();
  }

  setThirdWidgetState(String value) {
    if (_isThirdWidget){
      _isThirdWidget = false;
      _answers = [];
    }
      
    else{
      _isThirdWidget = true;
      _answers.add(value);
      checkAnswer();
    }
    notifyListeners();
  }

  setForWidgetState(String value) {
    if (_isForWidget){
      _isForWidget = false;
      _answers = [];
    }
      
    else{
      _isForWidget = true;
      _answers.add(value);
      checkAnswer();
    }
    notifyListeners();
  }

  // setFirstWidgetCorrect(){
  //   _firstWidgetIsCorrect = true;
  //   notifyListeners();
  // }
  // setSecondWidgetCorrect(){
  //   _secondWidgetIsCorrect = true;
  //   notifyListeners();
  // }
  // setThirdWidgetCorrect(){
  //   _thirdWidgetIsCorrect = true;
  //   notifyListeners();
  // }
  // setForWidgetCorrect(){
  //   _forWidgetIsCorrect = true;
  //   notifyListeners();
  // }
}
