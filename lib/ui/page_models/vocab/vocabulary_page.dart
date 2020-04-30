import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:learn_english/core/services/database_service.dart';
import 'package:learn_english/ui/page_models/vocab/vocab_list.dart';
import 'package:learn_english/ui/state/account_user.dart';
import 'package:learn_english/ui/state/correct_answer.dart';
import 'package:learn_english/ui/state/heart_state.dart';
import 'package:learn_english/ui/state/index.dart';
import 'package:learn_english/ui/state/recording.dart';
import 'package:learn_english/ui/state/result_learning_state.dart';
import 'package:learn_english/ui/state/slider_state.dart';
import 'package:learn_english/ui/state/state_of_answer_in_crossword_part.dart';
import 'package:learn_english/ui/state/state_of_continue_button.dart';
import 'package:learn_english/ui/state/state_of_crossword_list.dart';
import 'package:learn_english/ui/state/the_first_button_state.dart';
import 'package:learn_english/ui/state/the_second_button_state.dart';
import 'package:learn_english/ui/state/the_third_button_state.dart';
import 'package:provider/provider.dart';

class VocabularyPage extends StatelessWidget {
  Database _database = Database();
  String lessonId;
  VocabularyPage({this.lessonId});
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        FutureProvider<List<Vocabulary>>.value(
          value: _database.getVocabByLesson([lessonId]),
        ),
        ChangeNotifierProvider(
          create: (context) => Index(),
        ),
        ChangeNotifierProvider(
          create: (context) => ContinueButtonState(),
        ),
        ChangeNotifierProvider(
          create: (context) => Recording(),
        ),
        ChangeNotifierProvider(create: (context) => TheFirstButtonState()),
        ChangeNotifierProvider(
          create: (context) => TheSecondButtonState(),
        ),
        ChangeNotifierProvider(
          create: (context) => TheThirdButtonState(),
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
      ],
      child: VocabList(),
    );
  }
}
