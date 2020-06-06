import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:learn_english/ui/page_models/game/taptap/widgets/cell.dart';

class TextCell extends Cell {
  Vocabulary vocabulary;
  double textSize;
  double borderRadius;
  double padding;
  TextCell({this.vocabulary, this.textSize, this.borderRadius, this.padding}) : super();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(borderRadius/2),
              child: AutoSizeText(
                vocabulary.vocab,
                maxLines: 1,
                style: TextStyle(
                  fontSize: textSize,
                  color: Colors.blue[400],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
