import 'package:flutter/cupertino.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:provider/provider.dart';

class StateOfCrossWordList extends ChangeNotifier {
  List<bool> stateList = List.generate(15, (i) => false);


  setStateElement(int position){
    stateList[position] = true;
    notifyListeners();
  }
}
