import 'package:flutter/cupertino.dart';

class Matrix4By4State extends ChangeNotifier {
  bool _loading = true;
  int numberClickedCell = 0;
  int _score = 0;

  bool _isFirstWidget = false;
  bool _isSecondWidget = false;
  bool _isThirdWidget = false;
  bool _isForWidget = false;
  bool _isFiveWidget = false;
  bool _isSixWidget = false;
  bool _isSevenWidget = false;
  bool _isEightWidget = false;
  bool _isNineWidget = false;
  bool _isTenWidget = false;
  bool _isElevenWidget = false;
  bool _isTwelveWidget = false;
  bool _isThirteenWidget = false;
  bool _isForteenWidget = false;
  bool _isFifteenWidget = false;
  bool _isSixteenWidget = false;

  List<String> _answers = [];

  int _firstWidgetIsCorrect = 0;
  int _secondWidgetIsCorrect = 0;
  int _thirdWidgetIsCorrect = 0;
  int _forWidgetIsCorrect = 0;
  int _fiveWidgetIsCorrect = 0;
  int _sixWidgetIsCorrect = 0;
  int _sevenWidgetIsCorrect = 0;
  int _eightWidgetIsCorrect = 0;
  int _nineWidgetIsCorrect = 0;
  int _tenWidgetIsCorrect = 0;
  int _elevenWidgetIsCorrect = 0;
  int _twelveWidgetIsCorrect = 0;
  int _thirteenWidgetIsCorrect = 0;
  int _forteenWidgetIsCorrect = 0;
  int _fifteenWidgetIsCorrect = 0;
  int _sixteenWidgetIsCorrect = 0;

  //this value is declared to mark score
  bool _checkIsWrong = false;

  bool get getFirstWidgetState => _isFirstWidget;
  bool get getSecondWidgetState => _isSecondWidget;
  bool get getThirdWidgetState => _isThirdWidget;
  bool get getForWidgetState => _isForWidget;
  bool get getFiveWidgetState => _isFiveWidget;
  bool get getSixWidgetState => _isSixWidget;
  bool get getSevenWidgetState => _isSevenWidget;
  bool get getEightWidgetState => _isEightWidget;
  bool get getNineWidgetState => _isNineWidget;
  bool get getTenWidgetState => _isTenWidget;
  bool get getElevenWidgetState => _isElevenWidget;
  bool get getTwelveWidgetState => _isTwelveWidget;
  bool get getThirteenWidgetState => _isThirteenWidget;
  bool get getForteenWidgetState => _isForteenWidget;
  bool get getFifteenWidgetState => _isFifteenWidget;
  bool get getSixteenWidgetState => _isSixteenWidget;

  List<String> get getAnswers => _answers;

  int get getResultOfFirstWidget => _firstWidgetIsCorrect;
  int get getResultOfSecondWidget => _secondWidgetIsCorrect;
  int get getResultOfThirdWidget => _thirdWidgetIsCorrect;
  int get getResultOfForWidget => _forWidgetIsCorrect;
  int get getResultOfFiveWidget => _fiveWidgetIsCorrect;
  int get getResultOfSixWidget => _sixWidgetIsCorrect;
  int get getResultOfSevenWidget => _sevenWidgetIsCorrect;
  int get getResultOfEightWidget => _eightWidgetIsCorrect;
  int get getResultOfNineWidget => _nineWidgetIsCorrect;
  int get getResultOfTenWidget => _tenWidgetIsCorrect;
  int get getResultOfElevenWidget => _elevenWidgetIsCorrect;
  int get getResultOfTwelveWidget => _twelveWidgetIsCorrect;
  int get getResultOfThirteenWidget => _thirteenWidgetIsCorrect;
  int get getResultOfForteenWidget => _forteenWidgetIsCorrect;
  int get getResultOfFifteenWidget => _fifteenWidgetIsCorrect;
  int get getResultOfSixteenWidget => _sixteenWidgetIsCorrect;

  bool get getCheckIsWrong => _checkIsWrong;
  bool get getLoading => _loading;
  int get getScore => _score;

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
        if (_isFiveWidget) {
          _isFiveWidget = false;
          _fiveWidgetIsCorrect = 1;
        }
        if (_isSixWidget) {
          _isSixWidget = false;
          _sixWidgetIsCorrect = 1;
        }
        if (_isSevenWidget) {
          _isSevenWidget = false;
          _sevenWidgetIsCorrect = 1;
        }
        if (_isEightWidget) {
          _isEightWidget = false;
          _eightWidgetIsCorrect = 1;
        }
        if (_isNineWidget) {
          _isNineWidget = false;
          _nineWidgetIsCorrect = 1;
        }

        if (_isTenWidget) {
          _isTenWidget = false;
          _tenWidgetIsCorrect = 1;
        }

        if (_isElevenWidget) {
          _isElevenWidget = false;
          _elevenWidgetIsCorrect = 1;
        }
        if (_isTwelveWidget) {
          _isTwelveWidget = false;
          _twelveWidgetIsCorrect = 1;
        }
        if (_isThirteenWidget) {
          _isThirteenWidget = false;
          _thirteenWidgetIsCorrect = 1;
        }
        if (_isForteenWidget) {
          _isForteenWidget = false;
          _forteenWidgetIsCorrect = 1;
        }
        if (_isFifteenWidget) {
          _isFifteenWidget = false;
          _fifteenWidgetIsCorrect = 1;
        }
        if (_isSixteenWidget) {
          _isSixteenWidget = false;
          _sixteenWidgetIsCorrect = 1;
        }
        _score++;
        numberClickedCell = numberClickedCell + 2;
        print(_answers);
      } else {
        
        if (_isFirstWidget) _firstWidgetIsCorrect = 2;
        if (_isSecondWidget) _secondWidgetIsCorrect = 2;
        if (_isThirdWidget) _thirdWidgetIsCorrect = 2;
        if (_isForWidget) _forWidgetIsCorrect = 2;
        if (_isFiveWidget) _fiveWidgetIsCorrect = 2;
        if (_isSixWidget) _sixWidgetIsCorrect = 2;
        if (_isSevenWidget) _sevenWidgetIsCorrect = 2;
        if (_isEightWidget) _eightWidgetIsCorrect = 2;
        if (_isNineWidget) _nineWidgetIsCorrect = 2;
        if (_isTenWidget) _tenWidgetIsCorrect = 2;
        if (_isElevenWidget) _elevenWidgetIsCorrect = 2;
        if (_isTwelveWidget) _twelveWidgetIsCorrect = 2;
        if (_isThirteenWidget) _thirteenWidgetIsCorrect = 2;
        if (_isForteenWidget) _forteenWidgetIsCorrect = 2;
        if (_isFifteenWidget) _fifteenWidgetIsCorrect = 2;
        if (_isSixteenWidget) _sixteenWidgetIsCorrect = 2;
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
    if (_fiveWidgetIsCorrect == 2) {
      _isFiveWidget = false;
      _fiveWidgetIsCorrect = 0;
    }
    if (_sixWidgetIsCorrect == 2) {
      _isSixWidget = false;
      _sixWidgetIsCorrect = 0;
    }
    if (_sevenWidgetIsCorrect == 2) {
      _isSevenWidget = false;
      _sevenWidgetIsCorrect = 0;
    }
    if (_eightWidgetIsCorrect == 2) {
      _isEightWidget = false;
      _eightWidgetIsCorrect = 0;
    }
    if (_nineWidgetIsCorrect == 2) {
      _isNineWidget = false;
      _nineWidgetIsCorrect = 0;
    }
    if (_tenWidgetIsCorrect == 2) {
      _isTenWidget = false;
      _tenWidgetIsCorrect = 0;
    }
    if (_elevenWidgetIsCorrect == 2) {
      _isElevenWidget = false;
      _elevenWidgetIsCorrect = 0;
    }
    if (_twelveWidgetIsCorrect == 2) {
      _isTwelveWidget = false;
      _twelveWidgetIsCorrect = 0;
    }
    if (_thirteenWidgetIsCorrect == 2) {
      _isThirteenWidget = false;
      _thirteenWidgetIsCorrect = 0;
    }
    if (_forteenWidgetIsCorrect == 2) {
      _isForteenWidget = false;
      _forteenWidgetIsCorrect = 0;
    }
    if (_fifteenWidgetIsCorrect == 2) {
      _isFifteenWidget = false;
      _fifteenWidgetIsCorrect = 0;
    }
    if (_sixteenWidgetIsCorrect == 2) {
      _isSixteenWidget = false;
      _sixteenWidgetIsCorrect = 0;
    }
    notifyListeners();
  }

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  load() {
    if (numberClickedCell == 16) {
      _loading = true;
      _isFirstWidget = false;
      _isSecondWidget = false;
      _isThirdWidget = false;
      _isForWidget = false;
      _isFiveWidget = false;
      _isSixWidget = false;
      _isSevenWidget = false;
      _isEightWidget = false;
      _isNineWidget = false;
      _isTenWidget = false;
      _isElevenWidget = false;
      _isTwelveWidget = false;
      _isThirteenWidget = false;
      _isForteenWidget = false;
      _isFifteenWidget = false;
      _isSixteenWidget = false;
      _answers = [];
      _firstWidgetIsCorrect = 0;
      _secondWidgetIsCorrect = 0;
      _thirdWidgetIsCorrect = 0;
      _forWidgetIsCorrect = 0;
      _fiveWidgetIsCorrect = 0;
      _sixWidgetIsCorrect = 0;
      _sevenWidgetIsCorrect = 0;
      _eightWidgetIsCorrect = 0;
      _nineWidgetIsCorrect = 0;
      _tenWidgetIsCorrect = 0;
      _elevenWidgetIsCorrect = 0;
      _twelveWidgetIsCorrect = 0;
      _thirteenWidgetIsCorrect = 0;
      _forteenWidgetIsCorrect = 0;
      _fifteenWidgetIsCorrect = 0;
      _sixteenWidgetIsCorrect =0;

      _checkIsWrong = false;
      numberClickedCell = 0;
      // notifyListeners();
    }
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

  setFiveWidgetState(String value) {
    if (_isFiveWidget) {
      _isFiveWidget = false;
      _answers = [];
    } else {
      _isFiveWidget = true;
      _answers.add(value);
      checkAnswer();
    }
    notifyListeners();
  }

  setSixWidgetState(String value) {
    if (_isSixWidget) {
      _isSixWidget = false;
      _answers = [];
    } else {
      _isSixWidget = true;
      _answers.add(value);
      checkAnswer();
    }
    notifyListeners();
  }

  setSevenWidgetState(String value) {
    if (_isSevenWidget) {
      _isSevenWidget = false;
      _answers = [];
    } else {
      _isSevenWidget = true;
      _answers.add(value);
      checkAnswer();
    }
    notifyListeners();
  }

  setEightWidgetState(String value) {
    if (_isEightWidget) {
      _isEightWidget = false;
      _answers = [];
    } else {
      _isEightWidget = true;
      _answers.add(value);
      checkAnswer();
    }
    notifyListeners();
  }

  setNineWidgetState(String value) {
    if (_isNineWidget) {
      _isNineWidget = false;
      _answers = [];
    } else {
      _isNineWidget = true;
      _answers.add(value);
      checkAnswer();
    }
    notifyListeners();
  }
  setTenWidgetState(String value) {
    if (_isTenWidget) {
      _isTenWidget = false;
      _answers = [];
    } else {
      _isTenWidget = true;
      _answers.add(value);
      checkAnswer();
    }
    notifyListeners();
  }

  setElevenWidgetState(String value) {
    if (_isElevenWidget) {
      _isElevenWidget = false;
      _answers = [];
    } else {
      _isElevenWidget = true;
      _answers.add(value);
      checkAnswer();
    }
    notifyListeners();
  }

  setTwelveWidgetState(String value) {
    if (_isTwelveWidget) {
      _isTwelveWidget = false;
      _answers = [];
    } else {
      _isTwelveWidget = true;
      _answers.add(value);
      checkAnswer();
    }
    notifyListeners();
  }

  setThirteenWidgetState(String value) {
    if (_isThirteenWidget) {
      _isThirteenWidget = false;
      _answers = [];
    } else {
      _isThirteenWidget = true;
      _answers.add(value);
      checkAnswer();
    }
    notifyListeners();
  }

  setForteenWidgetState(String value) {
    if (_isForteenWidget) {
      _isForteenWidget = false;
      _answers = [];
    } else {
      _isForteenWidget = true;
      _answers.add(value);
      checkAnswer();
    }
    notifyListeners();
  }

  setFifteenWidgetState(String value) {
    if (_isFifteenWidget) {
      _isFifteenWidget = false;
      _answers = [];
    } else {
      _isFifteenWidget = true;
      _answers.add(value);
      checkAnswer();
    }
    notifyListeners();
  }

  setSixteenWidgetState(String value) {
    if (_isSixteenWidget) {
      _isSixteenWidget = false;
      _answers = [];
    } else {
      _isSixteenWidget = true;
      _answers.add(value);
      checkAnswer();
    }
    notifyListeners();
  }
}
