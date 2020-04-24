import 'package:flutter/cupertino.dart';

class Matrix2By2State extends ChangeNotifier {
  bool _loading = true;

  bool _isFirstWidget = false;
  bool _isSecondWidget = false;
  bool _isThirdWidget = false;
  bool _isForWidget = false;
  List<String> _answers = [];
  int _firstWidgetIsCorrect = 0;
  int _secondWidgetIsCorrect = 0;
  int _thirdWidgetIsCorrect = 0;
  int _forWidgetIsCorrect = 0;
  bool _checkIsCorrect = false; //this value is declared to mark score
  bool _checkIsWrong = false;

  bool get getFirstWidgetState => _isFirstWidget;
  bool get getSecondWidgetState => _isSecondWidget;
  bool get getThirdWidgetState => _isThirdWidget;
  bool get getForWidgetState => _isForWidget;
  List<String> get getAnswers => _answers;
  int get getResultOfFirstWidget => _firstWidgetIsCorrect;
  int get getResultOfSecondWidget => _secondWidgetIsCorrect;
  int get getResultOfThirdWidget => _thirdWidgetIsCorrect;
  int get getResultOfForWidget => _forWidgetIsCorrect;
  bool get getCheckIsCorrect => _checkIsCorrect;
  bool get getCheckIsWrong => _checkIsWrong;
  bool get getLoading => _loading;

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  load() {
    if (_firstWidgetIsCorrect == 1 &&
        _secondWidgetIsCorrect == 1 &&
        _thirdWidgetIsCorrect == 1 &&
        _forWidgetIsCorrect == 1) {
      _loading = true;
      _isFirstWidget = false;
      _isSecondWidget = false;
      _isThirdWidget = false;
      _isForWidget = false;
      _answers = [];
      _firstWidgetIsCorrect = 0;
      _secondWidgetIsCorrect = 0;
      _thirdWidgetIsCorrect = 0;
      _forWidgetIsCorrect = 0;
      _checkIsCorrect = false;
      _checkIsWrong = false;
      // notifyListeners();
    }
  }

  checkAnswer() {
    print(_answers);
    if (_answers.length == 2) {
      if (_answers[0] == _answers[1]) {
        print('TRUE');
        if (_isFirstWidget) _firstWidgetIsCorrect = 1;
        if (_isSecondWidget) _secondWidgetIsCorrect = 1;
        if (_isThirdWidget) _thirdWidgetIsCorrect = 1;
        if (_isForWidget) _forWidgetIsCorrect = 1;
        _checkIsCorrect = true;
      } else {
        print('FALSE');
        if (_isFirstWidget) _firstWidgetIsCorrect = 2;
        if (_isSecondWidget) _secondWidgetIsCorrect = 2;
        if (_isThirdWidget) _thirdWidgetIsCorrect = 2;
        if (_isForWidget) _forWidgetIsCorrect = 2;
        _checkIsWrong = true;
      }
      ;
      _answers = [];
    }
    notifyListeners();
  }

  fetch(){
    _checkIsWrong = false;
    if (_firstWidgetIsCorrect == 2){ 
      _isFirstWidget = false;
      _firstWidgetIsCorrect = 0;}
    if (_secondWidgetIsCorrect == 2){ 
      _isSecondWidget = false;
      _secondWidgetIsCorrect = 0;}
    if (_thirdWidgetIsCorrect == 2){ 
      _isThirdWidget = false;
      _thirdWidgetIsCorrect = 0;}
    if (_forWidgetIsCorrect == 2){ 
      _isForWidget = false;
      _forWidgetIsCorrect = 0;}
      notifyListeners();
  }

  setFirstWidgetState(String value) {
    if (_isFirstWidget) {
      _isFirstWidget = false;
      _answers = [];
    } else {
      _isFirstWidget = true;
      _answers.add(value);
      checkAnswer();
    }
    notifyListeners();
  }

  setSecondWidgetState(String value) {
    if (_isSecondWidget) {
      _isSecondWidget = false;
      _answers = [];
    } else {
      _isSecondWidget = true;
      _answers.add(value);
      checkAnswer();
    }
    notifyListeners();
  }

  setThirdWidgetState(String value) {
    if (_isThirdWidget) {
      _isThirdWidget = false;
      _answers = [];
    } else {
      _isThirdWidget = true;
      _answers.add(value);
      checkAnswer();
    }
    notifyListeners();
  }

  setForWidgetState(String value) {
    if (_isForWidget) {
      _isForWidget = false;
      _answers = [];
    } else {
      _isForWidget = true;
      _answers.add(value);
      checkAnswer();
    }
    notifyListeners();
  }

  setIsCorrectEqualFalse() {
    _checkIsCorrect = false;
    notifyListeners();
  }
}
