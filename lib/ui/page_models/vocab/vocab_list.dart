import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:learn_english/ui/page_models/vocab/choose_correct_translation.dart';

import 'package:learn_english/ui/page_models/vocab/listen_and_complete_sentence.dart';
import 'package:learn_english/ui/page_models/vocab/listen_and_repeat.dart';
import 'package:learn_english/ui/page_models/vocab/look_at_the_picture_and_choose_answer.dart';
import 'package:learn_english/ui/page_models/vocab/translate_sentence.dart';
import 'package:learn_english/ui/pages/finish_lesson_page.dart';
import 'package:learn_english/ui/provider/correct_answer.dart';
import 'package:learn_english/ui/provider/index.dart';
import 'package:learn_english/ui/provider/slider_state.dart';
import 'package:provider/provider.dart';

class VocabList extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    Index index = Provider.of<Index>(context);
    CorrectAnswer answer = Provider.of<CorrectAnswer>(context);
    SliderState sliderState = Provider.of<SliderState>(context);
    Random random = new Random();
    int randomNumber;
    return Consumer<List<Vocabulary>>(builder: (context, value, child) {
      if (value == null) return Center(child: CircularProgressIndicator());
      
        sliderState.setMaxOfSlider(value.length);
        
      if (index.getIndex >= value.length)
        return FinishLessonPage();
      else {
        if (value[index.getIndex].type == 1) {
          randomNumber = random.nextInt(4);
        } else if (value[index.getIndex].type == 2) {
          randomNumber = random.nextInt(3) + 2;
        } else if (value[index.getIndex].type == 3) {
          randomNumber = random.nextInt(3) + 2;
        }
        answer.setCorrectAnswer(value[index.getIndex].vocab);
        switch (randomNumber) {
          case 0:
            return LookAtThePictureAndChooseAnswer(
                vocabulary: value[index.getIndex]);
          case 1:
            return ListenAndRepeat(vocabulary: value[index.getIndex]);
          case 2:
            return ChooseCorrectTranslate(vocabulary: value[index.getIndex]);
          case 3:
            return ListenAndCompleteSentence(vocabulary: value[index.getIndex]);
          case 4:
            return TranslateSentence(vocabulary: value[index.getIndex]);
        }
      }
    });
  }
}
