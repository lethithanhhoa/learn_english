import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:learn_english/core/models/word.dart';
import 'package:learn_english/ui/common/microphone.dart';
import 'package:learn_english/ui/common/next_quiz_button.dart';
import 'package:learn_english/ui/page_models/learning_detail/speech.dart';
import 'package:provider/provider.dart';
import 'package:flutter_tts/flutter_tts.dart';

class NextQuiz extends ChangeNotifier {
  List<Word> listWord;
  NextQuiz({this.listWord});
  int index = 0;
  FlutterTts flutterTts = new FlutterTts();
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

// class MultipleProvider extends StatelessWidget{
//   List<Word> listWord;
//   Word word;
//   MultipleProvider({this.listWord});
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider<NextQuiz>(create: (context) => NextQuiz(listWord: listWord)),
//         ChangeNotifierProvider<RecordVoice>(create: (context) => RecordVoice(word: word)),
//       ],
//       child: Speech(),
//     );
//   }

// }
