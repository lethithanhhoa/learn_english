import 'package:flutter/cupertino.dart';


class IndexHomePage extends ChangeNotifier{
  int index = 0;
  int indexRank = 0;
  IndexHomePage({this.index, this.indexRank});
  // int get getIndex => index;

  setIndex(int number){
    index = number;
    if (index != 2) indexRank = 0;
    notifyListeners();
  }
}