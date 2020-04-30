import 'package:flutter/material.dart';
import 'package:learn_english/ui/common/close_lesson.dart';
import 'package:learn_english/ui/common/hearts.dart';
import 'package:learn_english/ui/common/slider_at_learning_vocab.dart';

Widget appBar = AppBar(
  automaticallyImplyLeading: false,
  title: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      CloseLesson(),
      Expanded(
       
        child: Row(
          children: <Widget>[
            Expanded(flex: 1, child: MySlider()),
            // Expanded(flex: 2, child: Heart(),),
            // Expanded(flex: 1, child: Container(),)
          ],
        ),
      ),
      
      
    ],
  ),
);
