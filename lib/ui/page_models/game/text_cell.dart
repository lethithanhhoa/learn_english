

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:learn_english/ui/page_models/game/cell.dart';

class TextCell extends Cell {
  Vocabulary vocabulary;
  double textSize;
  TextCell({this.vocabulary, this.textSize}) : super();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Center(
          child: Text(
            vocabulary.vocab,
            style: TextStyle(fontSize: textSize, 
            color: Colors.blue[300],
            ),
          ),
        ),
      ),
    );
  }
}
