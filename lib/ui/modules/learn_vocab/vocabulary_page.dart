import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:learn_english/core/services/firestore_service.dart';
import 'package:learn_english/ui/modules/learn_vocab/vocab_list.dart';
import 'package:learn_english/ui/provider/account_user.dart';
import 'package:learn_english/ui/provider/choice_button_state.dart';
import 'package:learn_english/ui/provider/correct_answer.dart';
import 'package:learn_english/ui/provider/index.dart';
import 'package:learn_english/ui/provider/num_of_correct_answer_state.dart';
import 'package:learn_english/ui/provider/recording.dart';
import 'package:learn_english/ui/provider/result_learning_state.dart';
import 'package:learn_english/ui/provider/slider_state.dart';
import 'package:learn_english/ui/provider/state_of_answer_in_crossword_part.dart';
import 'package:learn_english/ui/provider/state_of_continue_button.dart';
import 'package:learn_english/ui/provider/state_of_crossword_list.dart';
import 'package:provider/provider.dart';
import 'package:learn_english/core/services/vocab_service.dart';

class VocabularyPage extends StatelessWidget {
  // VocabService _vocabService = VocabService();
  FireStoreService _fireStoreService = FireStoreService();
  String lessonId;
  VocabularyPage({this.lessonId});
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        FutureProvider<List<Vocabulary>>.value(
          // value: _vocabService.getVocabListByLessonId(lessonId),
          value: _fireStoreService.getVocabByLesson(lessonId),
        ),
        ChangeNotifierProvider(
          create: (context) => Index(),
        ),
        ChangeNotifierProvider(
          create: (context) => ContinueButtonState(),
        ),
        ChangeNotifierProvider(
          create: (context) => RecordingVoice(),
        ),
        ChangeNotifierProvider(
          create: (context) => CrosswordAnswerState(),
        ),
        ChangeNotifierProvider(
          create: (context) => StateOfCrossWordList(),
        ),
        ChangeNotifierProvider(
          create: (context) => CorrectAnswer(),
        ),
        ChangeNotifierProvider(
          create: (context) => SliderState(),
        ),
        ChangeNotifierProvider(
          create: (context) => ResultLearningState(lessonId: lessonId),
        ),
        ChangeNotifierProvider(
          create: (context) => AccountUser(),
        ),
        ChangeNotifierProvider(create: (context) => NumOfCorrectAnswer()),
        ChangeNotifierProvider(create: (context) => ChoiceButtonState())
      ],
      child: VocabList(),
    );
  }
}
