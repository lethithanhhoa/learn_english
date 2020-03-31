

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:learn_english/core/services/database_service.dart';
import 'package:learn_english/ui/page_models/vocab/listen_and_choose_answer.dart';
import 'package:learn_english/ui/page_models/vocab/listen_and_complete_sentence.dart';
import 'package:learn_english/ui/page_models/vocab/look_at_the_picture_and_choose_answer.dart';
import 'package:learn_english/ui/page_models/vocab/translate_sentence.dart';
import 'package:learn_english/ui/provider/index.dart';
import 'package:learn_english/ui/provider/recording.dart';
import 'package:learn_english/ui/provider/state_of_answer_in_crossword_part.dart';
import 'package:learn_english/ui/provider/state_of_continue_button.dart';
import 'package:learn_english/ui/provider/state_of_crossword_list.dart';
import 'package:learn_english/ui/provider/the_first_button_state.dart';
import 'package:learn_english/ui/provider/the_second_button_state.dart';
import 'package:learn_english/ui/provider/the_third_button_state.dart';
import 'package:provider/provider.dart';

class VocabularyProvider extends StatelessWidget {
  Database _database = Database();
  String lessonId;
  VocabularyProvider({this.lessonId});
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        FutureProvider<List<Vocabulary>>.value(
            value: _database.getListOfVocab(lessonId)),
        ChangeNotifierProvider(
          create: (context) => Index(),
        ),
        ChangeNotifierProvider(
          create: (context) => StateOfButton(),
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
        ChangeNotifierProvider(create: (context) => CrosswordAnswerState(),),
        ChangeNotifierProvider(create: (context) => StateOfCrossWordList(),)
      ],
      child: VocabList(),
    );
  }
}

class VocabList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Index index = Provider.of<Index>(context);
    return Consumer<List<Vocabulary>>(builder: (context, value, child) {
      if (value == null) return Center(child: CircularProgressIndicator());
      if (index.getIndex >= value.length)
        return Scaffold(
          backgroundColor: Colors.pink,
        );
      List<Vocabulary> notMemorized;

      return (value[index.getIndex].type == 1)
          ? TranslateSentence(vocabulary: value[index.getIndex])
          : TranslateSentence(vocabulary: value[index.getIndex]);
    });
  }
}
