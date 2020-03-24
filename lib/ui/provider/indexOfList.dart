import 'package:flutter/cupertino.dart';

class Index extends ChangeNotifier {
  int index = 0;
  increment() {
    index++;
    notifyListeners();
  }
}