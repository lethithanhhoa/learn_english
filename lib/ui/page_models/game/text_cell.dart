import 'package:flutter/material.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:learn_english/ui/page_models/game/cell.dart';

class TextCell extends Cell {
  Vocabulary vocabulary;
  TextCell({this.vocabulary}) : super();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(5.0),
      child: Container(
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
              style: TextStyle(fontSize: 40, 
              color: Colors.blue[200]
              ),
            ),
          ),
        ),
      ),
    );
  }
}
