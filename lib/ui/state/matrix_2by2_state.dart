import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:learn_english/ui/page_models/game/widgets/cell.dart';
import 'package:learn_english/ui/page_models/game/widgets/image_cell.dart';
import 'package:learn_english/ui/page_models/game/widgets/text_cell.dart';

class Matrix2By2State extends ChangeNotifier {
  int firstIndex = 0;
  int secondIndex = 0;
  List<Cell> widgets = [];
  int numberClicked = 0;

  // bool _loading = true;
  int _score = 0;
  bool _isFirstWidget = false;
  bool _isSecondWidget = false;
  bool _isThirdWidget = false;
  bool _isForWidget = false;
  List<String> _answers = [];
  int _firstWidgetIsCorrect = 0;
  int _secondWidgetIsCorrect = 0;
  int _thirdWidgetIsCorrect = 0;
  int _forWidgetIsCorrect = 0;
  //this value is declared to mark score
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

  bool get getCheckIsWrong => _checkIsWrong;
  // bool get getLoading => _loading;
  int get getScore => _score;

  setWidgets(List<Vocabulary> vocabList){  
    Random random = Random();
      firstIndex = random.nextInt(vocabList.length);
      do {
        secondIndex = random.nextInt(vocabList.length);
      } while (firstIndex == secondIndex);

      widgets = [
        ImageCell(
          vocabulary: vocabList[firstIndex],
          textSize: 18,
          borderRadius: 15,
        ),
        TextCell(
          vocabulary: vocabList[firstIndex],
          textSize: 40,
          borderRadius: 15,
        ),
        ImageCell(
          vocabulary: vocabList[secondIndex],
          textSize: 18,
          borderRadius: 15,
        ),
        TextCell(
          vocabulary: vocabList[secondIndex],
          textSize: 40,
          borderRadius: 15,
        )
      ];
    widgets.shuffle();
    notifyListeners();
  }


  // setFirstIndex(int number){
  //   firstIndex = number;
  //   notifyListeners();
  // }

  // setSecondIndex(int number){
  //   secondIndex = number;
  //   notifyListeners();
  // }

  // setLoading(bool loading) {
  //   _loading = loading;
  //   notifyListeners();
  // }

  load(List<Vocabulary> vocabList) {
    if (numberClicked == 4) {
      setWidgets(vocabList);
      _isFirstWidget = false;
      _isSecondWidget = false;
      _isThirdWidget = false;
      _isForWidget = false;
      _answers = [];
      _firstWidgetIsCorrect = 0;
      _secondWidgetIsCorrect = 0;
      _thirdWidgetIsCorrect = 0;
      _forWidgetIsCorrect = 0;

      _checkIsWrong = false;
      numberClicked = 0;
      notifyListeners();
    }
  }

  checkAnswer() {
    if (_answers.length == 2) {
      if (_answers[0] == _answers[1]) {
        
        if (_isFirstWidget) {
          _isFirstWidget = false;
          _firstWidgetIsCorrect = 1;
        }
        if (_isSecondWidget) {
          _isSecondWidget = false;
          _secondWidgetIsCorrect = 1;
        }
        if (_isThirdWidget) {
          _isThirdWidget = false;
          _thirdWidgetIsCorrect = 1;
        }
        if (_isForWidget) {
          _isForWidget = false;
          _forWidgetIsCorrect = 1;
        }
        _score++;
        numberClicked = numberClicked + 2;
      } else {
       
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

  fetch() {
    _checkIsWrong = false;
    if (_firstWidgetIsCorrect == 2) {
      _isFirstWidget = false;
      _firstWidgetIsCorrect = 0;
    }
    if (_secondWidgetIsCorrect == 2) {
      _isSecondWidget = false;
      _secondWidgetIsCorrect = 0;
    }
    if (_thirdWidgetIsCorrect == 2) {
      _isThirdWidget = false;
      _thirdWidgetIsCorrect = 0;
    }
    if (_forWidgetIsCorrect == 2) {
      _isForWidget = false;
      _forWidgetIsCorrect = 0;
    }
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
}
