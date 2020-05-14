import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:learn_english/ui/modules/audio_player.dart';
import 'package:learn_english/ui/page_models/game/taptap/widget/cell.dart';
import 'package:learn_english/ui/page_models/game/taptap/widget/image_cell.dart';
import 'package:learn_english/ui/page_models/game/taptap/widget/matrix_2by2.dart';
import 'package:learn_english/ui/page_models/game/taptap/widget/matrix_2by3.dart';
import 'package:learn_english/ui/page_models/game/taptap/widget/matrix_3by2.dart';
import 'package:learn_english/ui/page_models/game/taptap/widget/matrix_3by3.dart';
import 'package:learn_english/ui/page_models/game/taptap/widget/matrix_3by4.dart';
import 'package:learn_english/ui/page_models/game/taptap/widget/matrix_4by3.dart';
import 'package:learn_english/ui/page_models/game/taptap/widget/matrix_4by4.dart';
import 'package:learn_english/ui/page_models/game/taptap/widget/matrix_4by5.dart';
import 'package:learn_english/ui/page_models/game/taptap/widget/matrix_5by4.dart';
import 'package:learn_english/ui/page_models/game/taptap/widget/matrix_5by5.dart';
import 'package:learn_english/ui/page_models/game/taptap/widget/text_cell.dart';

class LevelState extends ChangeNotifier {
  AudioPlayer _audioPlayer = AudioPlayer();

  List<Vocabulary> vocabList;
  int _currentLevel;
  List<bool> _widgetsState = List.filled(25, false);
  List<bool> _isCorrectWidget = List.filled(25, null);
  int _numOfCorrectWidgets = 0;
  bool _isFalse = false;
  bool _isFinish = false;
  Map<int, String> map = Map();

  List<Cell> _widgets = List();
  Widget _curWidget;

  LevelState({this.vocabList}) {
    _currentLevel = 1;

    genWidgets(2, 35, 20, 15, 5);
    _curWidget = Matrix2By2(
      widgets: _widgets,
    );
  }

  int get getCurrentLevel => _currentLevel;
  Widget get getCurWidget => _curWidget;
  List<Widget> get getWidgets => _widgets;
  bool get getIsFalse => _isFalse;
  bool get getIsFinish => _isFinish;

  bool getWidgetState(int index) {
    return _widgetsState[index];
  }

  bool getIsCorrectWidget(int index) {
    return _isCorrectWidget[index];
  }

  setFinishIsTrue() {
    _isFinish = true;
    notifyListeners();
  }

  setIsFalseIsTrue() {
    _isFalse = true;

    notifyListeners();
  }

  backToPreState(){
    
    _isFalse = false;

    _widgetsState[map.keys.first] = false;
    _isCorrectWidget[map.keys.first] = null;

    _widgetsState[map.keys.last] = false;
    _isCorrectWidget[map.keys.last] = null;
    removeMap();
    notifyListeners();
  }

  setWidgetState(int index, Vocabulary vocabulary) {
    _audioPlayer.playDragSound();
    if (_widgetsState[index]) {
      _widgetsState[index] = false;
      map.remove(index);
    } else {
      _widgetsState[index] = true;
      map[index] = vocabulary.vocab;
    }

    if (map.keys.length == 2) {
      if (map.values.first == map.values.last) {
        setValueForListByMap(true);
        // _audioPlayer.playCorrectSound();
        _numOfCorrectWidgets += 2;
        removeMap();
      } else {
        setValueForListByMap(false);
        _isFalse = true;
        _audioPlayer.playOhNoSound();
      }
    }
    loadNewCurWidget();
    notifyListeners();
  }

  removeMap() {
    map.remove(map.keys.first);
    map.remove(map.keys.last);
    notifyListeners();
  }

  setValueForListByMap(bool value) {
    _isCorrectWidget[map.keys.first] = value;
    _isCorrectWidget[map.keys.last] = value;
    notifyListeners();
  }

  loadNewCurWidget() {
    switch (_currentLevel) {
      case 1:
        {
          if (_numOfCorrectWidgets == 4) {
            _widgets = [];
            genWidgets(3, 30, 18, 12, 4);
            _curWidget = Matrix2By3(
              widgets: _widgets,
            );
            setDefaultState();
          }
          break;
        }
      case 2:
        {
          if (_numOfCorrectWidgets == 6) {
            _widgets = [];
            genWidgets(3, 25, 16, 12, 4);
            _curWidget = Matrix3By2(
              widgets: _widgets,
            );
            setDefaultState();
          }
          break;
        }
      case 3:
        {
          if (_numOfCorrectWidgets == 6) {
            _widgets = [];
            genWidgets(5, 25, 16, 10, 3);
            _curWidget = Matrix3By3(
              widgets: _widgets,
            );
            setDefaultState();
          }
          break;
        }
      case 4:
        {
          if (_numOfCorrectWidgets == 8) {
            _widgets = [];
            genWidgets(6, 25, 16, 9, 3);
            _curWidget = Matrix3By4(
              widgets: _widgets,
            );
            setDefaultState();
          }
          break;
        }
      case 5:
        {
          if (_numOfCorrectWidgets == 12) {
            _widgets = [];
            genWidgets(6, 25, 16, 9, 3);
            _curWidget = Matrix4By3(
              widgets: _widgets,
            );
            setDefaultState();
          }
          break;
        }
      case 6:
        {
          if (_numOfCorrectWidgets == 12) {
            _widgets = [];
            genWidgets(8, 25, 16, 6, 2.5);
            _curWidget = Matrix4By4(
              widgets: _widgets,
            );
            setDefaultState();
          }
          break;
        }
      case 7:
        {
          if (_numOfCorrectWidgets == 16) {
            _widgets = [];
            genWidgets(10, 23, 16, 6, 2.5);
            _curWidget = Matrix4By5(
              widgets: _widgets,
            );
            setDefaultState();
          }
          break;
        }

      case 8:
        {
          if (_numOfCorrectWidgets == 20) {
            _widgets = [];
            genWidgets(10, 23, 16, 6, 2.5);
            _curWidget = Matrix5By4(
              widgets: _widgets,
            );
            setDefaultState();
          }
          break;
        }
      case 9:
        {
          if (_numOfCorrectWidgets == 20) {
            _widgets = [];
            genWidgets(13, 20, 14, 5, 2);
            _curWidget = Matrix5By5(
              widgets: _widgets,
            );
            setDefaultState();
          }
          break;
        }
      case 10:
        {
          if (_numOfCorrectWidgets == 24) {
            _isFinish = true;
          }
          break;
        }
    }

    notifyListeners();
  }

  genWidgets(int lenght, double textSize1, double textSize2,
      double borderRadius, double padding) {
    vocabList.shuffle();
    for (int i = 0; i < lenght; i++) {
      _widgets.add(TextCell(
        vocabulary: vocabList[i],
        textSize: textSize1,
        borderRadius: borderRadius,
        padding: padding,
      ));
      _widgets.add(ImageCell(
        vocabulary: vocabList[i],
        textSize: textSize2,
        borderRadius: borderRadius,
        padding: padding,
      ));
    }
    _widgets.shuffle();
    notifyListeners();
  }

  setDefaultState() {
    _numOfCorrectWidgets = 0;
    _currentLevel += 1;
    _isCorrectWidget.fillRange(0, 24, null);
    _widgetsState.fillRange(0, 24, false);
    notifyListeners();
  }
}
