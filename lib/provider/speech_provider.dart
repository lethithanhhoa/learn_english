import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:learn_english/core/models/word.dart';
import 'package:learn_english/ui/page_models/learning_detail/speech.dart';
import 'package:provider/provider.dart';

class NextQuiz extends ChangeNotifier {
  List<Word> listWord;
  NextQuiz({this.listWord});
  int index = 0;
  Word get getCurrentWord {
    return listWord[index];
  }

  setIndex() {
    if (index >= listWord.length - 1) return null;
    index++;
    notifyListeners();
  }
}

class SpeechProvider extends StatelessWidget {
  List<Word> listWord;
  SpeechProvider({this.listWord});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NextQuiz>(
      create: (context) => NextQuiz(listWord: listWord),
      child: Speech(),
    );
  }
}