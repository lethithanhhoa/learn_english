import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:learn_english/ui/provider/correct_answer.dart';
import 'package:learn_english/ui/provider/index.dart';
import 'package:learn_english/ui/provider/slider_state.dart';
import 'package:provider/provider.dart';

import '../loading_page.dart';
import 'choose_correct_translation.dart';
import 'end_of_lesson_page.dart';
import 'listen_and_choose_correct_answer.dart';
import 'listen_and_complete_sentence.dart';
import 'listen_and_repeat.dart';
import 'look_at_the_picture_and_choose_answer.dart';
import 'translate_sentence.dart';

class VocabList extends StatelessWidget {
  bool loading = true;
  @override
  Widget build(BuildContext context) {
    Index index = Provider.of<Index>(context);
    CorrectAnswer answer = Provider.of<CorrectAnswer>(context);
    SliderState sliderState = Provider.of<SliderState>(context);
    Random random = new Random();
    int randomNumber;
    return Consumer<List<Vocabulary>>(builder: (context, value, child) {
      if (value == null) return LoadingPage();

      sliderState.setMaxOfSlider(value.length);
      if (loading) {
        value.shuffle();
        loading = false;
      }
      if (index.getIndex >= value.length)
        return EndOfLessonPage();
      else {
        if (value[index.getIndex].type == 1) {
          randomNumber = random.nextInt(5);
        } else if (value[index.getIndex].type == 2) {
          randomNumber = random.nextInt(3) + 3;
        } else if (value[index.getIndex].type == 3) {
          randomNumber = random.nextInt(3) + 3;
        }
        answer.setCorrectAnswer(value[index.getIndex].vocab);
        randomNumber = 1;
        switch (randomNumber) {
          case 0:
            return PageToLookAtThePictureAndChooseAnswer(
                vocabulary: value[index.getIndex]);

          case 1:
            return PageToListenAndRepeat(vocabulary: value[index.getIndex]);

          case 2:
            return PageToChooseCorrectTranslate(
                vocabulary: value[index.getIndex]);

          case 3:
            return PageToListenAndCompleteSentence(
                vocabulary: value[index.getIndex]);

          case 4:
            return PageToListenAndChooseCorrectAnswer(
                vocabulary: value[index.getIndex]);

          case 5:
            return PageToTranslateSentence(vocabulary: value[index.getIndex]);
        }
      }
    });
  }
}
