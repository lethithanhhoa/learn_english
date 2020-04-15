import 'package:flutter/cupertino.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:provider/provider.dart';

class StateOfCrossWordList extends ChangeNotifier {
  List<bool> stateList = List.generate(15, (i) => false);
  List<dynamic> list = [];

  generateCrosswords(Vocabulary vocabulary) {
    list = vocabulary.vocab.replaceAll("I'm", "I am").split(' ');
    vocabulary.otherWord.forEach((f) => f
        .toString()
        .replaceAll("I'm", "I am")
        .split(' ')
        .forEach((item) => (list.contains(item) ? null : list.add(item))));
    list.shuffle();
    notifyListeners();
  }

  setStateElement(int position){
    stateList[position] = true;
    notifyListeners();
  }
}
